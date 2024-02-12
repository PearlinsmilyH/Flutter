int factorial(int n) {
  // Function to calculate the factorial of a number
  if (n == 0 || n == 1) {
    return 1;
  } else {
    return n * factorial(n - 1);
  }
}

void printFactorial(int num) {
  print("Factorial of $num is: ${factorial(num)}");
}

void main() {
  // Function call with arguments
  printFactorial(5);
}
