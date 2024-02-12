int add(int a, int b) {
  return a + b;
}

int subtract(int a, int b) {
  return a - b;
}

void main() {
  int num1 = 10;
  int num2 = 5;

  // Call the add function and print the result
  int sum = add(num1, num2);
  print("Addition of $num1 and $num2 is: $sum");

  // Call the subtract function and print the result
  int difference = subtract(num1, num2);
  print("Subtraction of $num1 and $num2 is: $difference");
}
