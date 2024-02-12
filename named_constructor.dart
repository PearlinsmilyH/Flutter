class Employee {
  String name = "";
  int empid = 0;
  int age = 0;

  Employee(this.name, this.empid, this.age); // Default Constructor

  Employee.newEmployee(String name, int empid, int age) {
    //named constructor

    this.name = name;
    this.empid = empid;
    this.age = age;
  }

  void printDetails() {
    print("Name: $name, Emp.Id: $empid, Age: $age");
  }
}

void main() {
  Employee emp1 = Employee("Smily", 76, 25);
  emp1.printDetails();

  Employee emp2 =
      Employee.newEmployee("pearlin", 77, 26); //using named constructor
  emp2.printDetails();
}
