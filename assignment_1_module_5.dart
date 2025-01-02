abstract class Role {
  void displayRole();
}

class Person {
  String _name = "";
  int _age = 0;
  String _address = "";

  void setName(String name) => _name = name;
  void setAge(int age) => _age = age;
  void setAddress(String address) => _address = address;

  String get getName => _name;
  int get getAge => _age;
  String get getAddress => _address;
}

class Student extends Person implements Role {
  String _studentID = "";
  String _grade = "";
  List<double> _courseScores = [];

  void setStudentID(String studentID) => _studentID = studentID;
  void setGrade(String grade) => _grade = grade;
  void setCourseScores(List<double> courseScores) =>
      _courseScores = courseScores;

  @override
  void displayRole() {
    print("Role: Student");
    print("Name: $getName, Age: $getAge, Address: $getAddress");
    print("Student ID: $_studentID, Grade: $_grade");
    print("Course Scores: $_courseScores");
    print("Average Score: ${calculateAverageScore().toStringAsFixed(2)}");
  }

  double calculateAverageScore() {
    if (_courseScores.isEmpty) {
      return 0.0;
    }
    double totalScore = _courseScores.reduce((a, b) => a + b);
    return totalScore / _courseScores.length;
  }
}

class Teacher extends Person implements Role {
  String _teacherID = "";
  List<String> _coursesTaught = [];

  void setTeacherID(String teacherID) => _teacherID = teacherID;
  void setCoursesTaught(List<String> coursesTaught) =>
      _coursesTaught = coursesTaught;

  @override
  void displayRole() {
    print("Role: Teacher");
    print("Name: $getName, Age: $getAge, Address: $getAddress");
    print("Teacher ID: $_teacherID");
    print("Courses Taught:");
    displayCoursesTaught();
  }

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

void main() {
  Student student = Student();
  student.setName("MI Rony");
  student.setAge(35);
  student.setAddress("123 Shewrapara");
  student.setStudentID("S12345");
  student.setGrade("A");
  student.setCourseScores([85.5, 90.0, 78.0, 92.5]);

  Teacher teacher = Teacher();
  teacher.setName("Mr. Toufiq");
  teacher.setAge(45);
  teacher.setAddress("23 Gulshan Avenue");
  teacher.setTeacherID("T98765");
  teacher.setCoursesTaught(["Mathematics", "Physics", "Computer Science"]);

  student.displayRole();
  print("");
  teacher.displayRole();
}
