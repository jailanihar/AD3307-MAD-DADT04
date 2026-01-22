// importing dart:io file
import 'dart:io';

void main()
{
    // print("Enter your name?");
    
    // Reading name of the Geek
    // null safety in name string
    // String? name = stdin.readLineSync(); 

    // // Printing the name
    // print("Hello, $name! \nWelcome to GeeksforGeeks!!");
    print('the principal');
    int? prince=int.parse(stdin.readLineSync()!);
    print('the time');
    int? time=int.parse(stdin.readLineSync()!);
    print('the ratio');
    int? ratio=int.parse(stdin.readLineSync()!);
    
    double interest=prince*time*ratio/100;
    print('The interest is : $interest');
}