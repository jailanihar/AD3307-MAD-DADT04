enum Gender { male, female, others }
// enum is a class that contain constant values

void main() {
  for (Gender g in Gender.values) {
    print(g);
  }
}
