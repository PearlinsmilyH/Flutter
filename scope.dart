int age1 = 10; // Global variable

void scope() {
  // Function

  int age2 = 20; // Local variable1

  print(
      "Inside function - Global variable: $age1"); // Accessing global variable within the function

  print("Inside function - Local variable: $age2"); // Accessing local variable1

  // Block scope
  {
    int age3 = 30; //local variable2
    print("Inside nested block - Local variable: $age3");
  }

  // Attempting to access nested block local variable1 outside its scope will result in an error
  // print("Outside nested block - Local variable: $age3"); // Uncommenting this line will result in an error
}

void main() {
  // Accessing global variable from main function
  print("Outside function - Global variable: $age1");

  // Uncommenting the line below will result in an error as age2 is not accessible here
  // print("Outside function - Local variable: $age2");

  // Function call to demonstrate variable scopes
  scope();
}
