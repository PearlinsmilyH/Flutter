class Employee {
  static int num = 0;
  static var emp_dept; //static variable
  var emp_name;
  int emp_salary = 0;

  static disp() {
    //static method
    print("Total no. Employees:${Employee.num}");
  }

  showDetails() {
    print("Name of the Employee is: ${emp_name}");
    print("Salary of the Employee is: ${emp_salary}");
    print("Dept. of the Employee is: ${emp_dept}");
  }
}

void main() {
  Employee.num = 2; //for static need not to create objects

  Employee e1 = new Employee();
  Employee e2 = new Employee();
  Employee.emp_dept = "Comp.Sci"; //for static need not to create objects

  Employee.disp();

  e1.emp_name = 'Smily';
  e1.emp_salary = 10000;
  e1.showDetails();

  e2.emp_name = 'Pearlin';
  e2.emp_salary = 15000;
  e2.showDetails();
}
