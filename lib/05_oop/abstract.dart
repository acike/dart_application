// Define an abstract class
abstract class Animal {
  void eat(); // Abstract method (no implementation)
  void sleep();
  void run() {
    print('running');
  }
}

// Concrete class that extends the abstract class
class Cat extends Animal {
  @override
  void eat() {
    print('The cat is eating');
  }

  @override
  void sleep() {
    print('sleeping');
  }
}

void main() {
  final Cat cat = Cat();
  cat.eat(); // Output: The cat is eating
  cat.sleep(); // Output: Sleeping...
  cat.run();
}
