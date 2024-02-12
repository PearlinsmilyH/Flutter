class Employee {
  var name;
  var empid;
  var age;

  Employee(var name, var empid, var age) {
    // Constructor
    this.name = name;
    this.empid = empid;
    this.age = age;
  }

  void printDetails() {
    print("Name: $name, Emp.Id: $empid, Age: $age");
  }
}

void main() {
  Employee emp = Employee("Smily", 76, 25);
  emp.printDetails();
}
