void display(String name, [String message]) {  //[] optional parameter
  if (message != null) {
    print('$message, $name!');
  } else {
    print('Hello, $name!');
  }
}

void main() {
  display('Alice'); // Hello, Alice!
  display('Bob', 'Good morning'); // Good morning, Bob!
}
