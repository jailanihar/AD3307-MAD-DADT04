void main() {
  print('Hello, Dart!');
  String name = 'Jailani';
  int age = 30;
  // String concatenation
  print('Name: ' + name + ', Age: ' + age.toString());
  // String interpolation
  print('Name: $name, Age: $age');
  print('Name: $name, Age: ${age.toString()}');
}