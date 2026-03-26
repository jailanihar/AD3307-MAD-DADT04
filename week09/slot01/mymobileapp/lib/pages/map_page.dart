import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:mymobileapp/components/my_scaffold.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final MapController _mapController = MapController();
  LatLng _currentLocation = LatLng(4.9035564, 114.9323964);
  LatLng? _selectedLocation;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if(permission == LocationPermission.denied) {
      return;
    }
    if(permission == LocationPermission.deniedForever) {
      return;
    }
    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      _currentLocation = LatLng(position.latitude, position.longitude);
    });
    _mapController.move(_currentLocation, _mapController.camera.zoom);
  }

  void _setSelectedLocation(LatLng point) {
    setState(() {
      _selectedLocation = point;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: 'Map Page',
      body: Container(
        height: 500,
        child: Stack(
          children: [
            FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter: _currentLocation,
                initialZoom: 19.0,
                onTap: (tapPosition, point) => _setSelectedLocation(point),
              ),
              children: [
                TileLayer(
                  urlTemplate: 
                    'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: _currentLocation,
                      child: Icon(
                        Icons.my_location,
                        color: Colors.blue,
                        size: 30,
                      ),
                    ),
                    if(_selectedLocation != null)
                      Marker(
                        point: _selectedLocation!,
                        child: Icon(
                          Icons.pin_drop,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                  ],
                ),
              ],
            ),
            Positioned(
              right: 20,
              bottom: 20,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if(_selectedLocation != null) {
                        _mapController.move(
                          _selectedLocation!,
                          _mapController.camera.zoom
                        );
                      }
                    },
                    child: const Icon(Icons.pin_drop, size: 24),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _mapController.move(
                        _currentLocation,
                        _mapController.camera.zoom
                      );
                    },
                    child: const Icon(Icons.my_location, size: 24),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedLocation = null;
                      });
                    },
                    child: const Icon(Icons.cancel, size: 24),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}