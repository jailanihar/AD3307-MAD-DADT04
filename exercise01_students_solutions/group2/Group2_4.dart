import 'dart:io';

void main() {
  List<String> friends = [];

  print("Enter 7 friend names:");

  for (int i = 1; i <= 7; i++) {
    stdout.write("Friend $i: ");
    String name = stdin.readLineSync()!;
    friends.add(name);
  }

  // print("\nYour friends:");
  // for (String friend in friends) {
  //   print("- $friend");
  // }

  // Find names starting with 'A'
  List<String> aNames = friends.where((name) {
    return name.isNotEmpty && name[0].toLowerCase() == 'a';
  }).toList();

  print("\nFriends with names starting with 'A':");
  if (aNames.isNotEmpty) {
    aNames.forEach(print);
  } else {
    print("None");
  }
}
