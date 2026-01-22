import 'dart:io';

void main() {
  //square number of ussr input
  print("Enter a number:");
  int num = int.parse(stdin.readLineSync()!);

  int square = num * num;
  print("Square of $num is: $square");
}
