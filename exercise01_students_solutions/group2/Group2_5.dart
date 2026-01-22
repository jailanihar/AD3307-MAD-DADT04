class House {
  int id;
  String name;
  double prize;

  House(this.id, this.name, this.prize);
  void displayDetails() {
    print('id:$id');
    print('name:$name');
    print('prize:$prize');
    print('----------');
  }
}

void main() {
  House house1 = House(1, 'villa', 250000.0);
  House house2 = House(2, 'apartment', 150000.0);
  House house3 = House(3, 'bungalow', 300000.0);

  List<House> houseList = [house1, house2, house3];

  for (var house in houseList) {
    house.displayDetails();
  }
}
