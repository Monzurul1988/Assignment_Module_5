// Abstract class defining the Role
abstract class Role {
  void displayRole(); // Abstract method to be implemented by subclasses
}

// Base class with common attributes
class Person {
  String _name = "";
  int _age = 0;
  String _address = "";

  // Setters for attributes
  void setName(String name) => _name = name;
  void setAge(int age) => _age = age;
  void setAddress(String address) => _address = address;

  // Getters for attributes
  String get getName => _name;
  int get getAge => _age;
  String get getAddress => _address;
}

// Class representing the Student role
class Student extends Person implements Role {
  String _studentID = "";
  String _grade = "";
  List<double> _courseScores = [];

  // Setters for student-specific attributes
  void setStudentID(String studentID) => _studentID = studentID;
  void setGrade(String grade) => _grade = grade;
  void setCourseScores(List<double> courseScores) => _courseScores = courseScores;

  // Override the displayRole() method
  @override
  void displayRole() {
    print("Role: Student");
    print("Name: $getName, Age: $getAge, Address: $getAddress");
    print("Student ID: $_studentID, Grade: $_grade");
    print("Course Scores: $_courseScores");
    print("Average Score: ${calculateAverageScore().toStringAsFixed(2)}");
  }

  // Method to calculate the average score of courses
  double calculateAverageScore() {
    if (_courseScores.isEmpty) {
      return 0.0; // Return 0 if there are no scores
    }
    double totalScore = _courseScores.reduce((a, b) => a + b);
    return totalScore / _courseScores.length;
  }
}

// Class representing the Teacher role
class Teacher extends Person implements Role {
  String _teacherID = "";
  List<String> _coursesTaught = [];

  // Setters for teacher-specific attributes
  void setTeacherID(String teacherID) => _teacherID = teacherID;
  void setCoursesTaught(List<String> coursesTaught) => _coursesTaught = coursesTaught;

  // Override the displayRole() method
  @override
  void displayRole() {
    print("Role: Teacher");
    print("Name: $getName, Age: $getAge, Address: $getAddress");
    print("Teacher ID: $_teacherID");
    print("Courses Taught:");
    displayCoursesTaught();
  }

  // Method to display the courses taught by the teacher
  void displayCoursesTaught() {
    if (_coursesTaught.isEmpty) {
      print("No courses taught.");
    } else {
      for (int i = 0; i < _coursesTaught.length; i++) {
        print("${i + 1}. ${_coursesTaught[i]}");
      }
    }
  }
}

// Main function to test the implementation
void main() {
  // Create a Student object and set attributes using methods
  Student student = Student();
  student.setName("Alice");
  student.setAge(20);
  student.setAddress("123 Elm Street");
  student.setStudentID("S12345");
  student.setGrade("A");
  student.setCourseScores([85.5, 90.0, 78.0, 92.5]);

  // Create a Teacher object and set attributes using methods
  Teacher teacher = Teacher();
  teacher.setName("Mr. Smith");
  teacher.setAge(45);
  teacher.setAddress("456 Oak Avenue");
  teacher.setTeacherID("T98765");
  teacher.setCoursesTaught(["Mathematics", "Physics", "Computer Science"]);

  // Use displayRole() to display details
  student.displayRole();
  print(""); // Add a blank line for clarity
  teacher.displayRole();
}