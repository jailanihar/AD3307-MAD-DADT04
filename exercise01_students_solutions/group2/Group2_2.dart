import 'dart:io';

// Write a dart program to calculate the sum of natural numbers.

void main() {
  stdout.write("Enter first natural number: ");
  int n1 = int.parse(stdin.readLineSync()!);

  stdout.write("Enter second natural number: ");
  int n2 = int.parse(stdin.readLineSync()!);

  int sum = n1 + n2;

  print("Sum of natural numbers: $sum");
}
