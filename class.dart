class Employee {
  var name;
  var empid;
  var age;

  void printDetails() {
    print("Name: $name, Emp.Id: $empid, Age: $age");
  }
}

void main() {
  Employee emp = Employee(); // Create an instance of the class
  emp.name = "Smily";
  emp.empid = 76;
  emp.age = 25;
  emp.printDetails(); // Call the method to print details
}
