class Student {
  String name;
  double mathScore;
  double physicsScore;
  double chemistryScore;

  Student({
    required this.name,
    required this.mathScore,
    required this.physicsScore,
    required this.chemistryScore,
  });

  // Tính điểm trung bình
  double get averageScore => (mathScore + physicsScore + chemistryScore) / 3;

  // Xếp loại học lực
  String get grade {
    double avg = averageScore;
    if (avg < 5) {
      return "Kém";
    } else if (avg < 7) {
      return "Khá";
    } else if (avg < 9) {
      return "Giỏi";
    } else {
      return "Xuất sắc";
    }
  }

  // Hiển thị thông tin sinh viên
  void displayInfo() {
    print(
      "Họ tên: $name | Toán: $mathScore | Lý: $physicsScore | Hóa: $chemistryScore | ĐTB: ${averageScore.toStringAsFixed(2)} | Xếp loại: $grade",
    );
  }
}

class StudentManager {
  List<Student> students = [];

  // 1. Thêm sinh viên
  void addStudent(String name, double math, double physics, double chemistry) {
    students.add(
      Student(
        name: name,
        mathScore: math,
        physicsScore: physics,
        chemistryScore: chemistry,
      ),
    );
    print("Thêm sinh viên '$name' thành công!");
  }

  // 2. Hiển thị danh sách sinh viên
  void displayStudents() {
    if (students.isEmpty) {
      print("Danh sách sinh viên trống.");
      return;
    }
    print("\n--- DANH SÁCH SINH VIÊN ---");
    for (int i = 0; i < students.length; i++) {
      print("${i + 1}. ");
      students[i].displayInfo();
    }
  }

  // 3. Tìm sinh viên có ĐTB cao nhất
  void findTopStudent() {
    if (students.isEmpty) {
      print("Danh sách sinh viên trống.");
      return;
    }

    Student topStudent = students[0];
    for (var student in students) {
      if (student.averageScore > topStudent.averageScore) {
        topStudent = student;
      }
    }

    print("\n--- SINH VIÊN CÓ ĐTB CAO NHẤT ---");
    topStudent.displayInfo();
  }
}

void main() {
  StudentManager manager = StudentManager();

  manager.addStudent("Nguyễn Văn A", 8.0, 7.5, 9.0);
  manager.addStudent("Trần Thị B", 4.5, 5.0, 4.0);
  manager.addStudent("Lê Hoàng C", 9.5, 9.0, 9.5);

  // Hiển thị danh sách
  manager.displayStudents();

  // Sinh viên có ĐTB cao nhất
  manager.findTopStudent();

  print("\n Kết thúc chương trình.");
}
