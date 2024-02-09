void main()
{
  int age = 25;                              // Integer variables
  
  double height = 5.9;                       // Double variables
  
  String name = "Smily";                     // String variables
  
  bool isStudent = true;                     // Boolean variables
  
  List<int> numbers = [1, 2, 3, 4, 5];       // List variables
  
  // Map variables
  Map<String, dynamic> person = {
    'name': 'Alice',
    'age': 30,
    'isStudent': false
  };
  
  // Dynamic variables
  dynamic dynamicVar = "This is a dynamic variable";
  
  // Final variables
  final String finalVar = "This is a final variable";
  
  // Const variables
  const int constVar = 100;
  
  // Print variable values
  print("Age: $age");
  print("Height: $height");
  print("Name: $name");
  print("Is Student: $isStudent");
  print("Numbers: $numbers");
  print("Person: $person");
  print("Dynamic Variable: $dynamicVar");
  print("Final Variable: $finalVar");
  print("Const Variable: $constVar");
}
