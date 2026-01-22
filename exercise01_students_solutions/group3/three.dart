void main() {
  print(maxNumber(301, 200, 500)); //arguments
}

// parameter must have data type declared
// type of class must have data type declared
int maxNumber(int number1, int number2, int number3) {
  if (number1 >= number2 && number1 >= number3) {
    return number1;
  } else if (number2 >= number1 && number2 >= number3) {
    return number2;
  } else {
    return number3;
  }
}
