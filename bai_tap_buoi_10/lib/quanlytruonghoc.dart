// 1. Lớp Person
class Person {
  String id;
  String name;
  int age;
  String gender;

  Person(this.id, this.name, this.age, this.gender);
}

// 2. Lớp Student
class Student extends Person {
  String grade;
  double score;

  Student(
    String id,
    String name,
    int age,
    String gender,
    this.grade,
    this.score,
  ) : super(id, name, age, gender);

  // Phương thức: hiển thị thông tin sinh viên
  void hienThiThongTin() {
    print(
      'Học sinh - ID: $id | Họ tên: $name | Tuổi: $age | Giới tính: $gender | Lớp: $grade | Điểm: $score',
    );
  }
}

// 3. Lớp Teacher
class Teacher extends Person {
  String subject;
  double salary;

  Teacher(
    String id,
    String name,
    int age,
    String gender,
    this.subject,
    this.salary,
  ) : super(id, name, age, gender);

  // Phương thức: hiển thị thông tin giáo viên
  void hienThiThongTin() {
    print(
      'Giáo viên - ID: $id | Họ tên: $name | Tuổi: $age | Giới tính: $gender | Môn: $subject | Lương: $salary',
    );
  }
}

// 4. Lớp Classroom
class Classroom {
  String id;
  String name;
  List<Student> students = [];
  Teacher? teacher;

  Classroom(this.id, this.name, [this.teacher]);

  // Thêm học sinh vào lớp
  void themHocSinh(Student student) {
    students.add(student);
  }

  // Gán giáo viên phụ trách lớp
  void ganGiaoVien(Teacher teacher) {
    this.teacher = teacher;
  }

  // Hiển thị thông tin lớp học
  void hienThiThongTin() {
    print('-----------------------------------');
    print('Lớp học: $name (ID: $id)');
    if (teacher != null) {
      print('Giáo viên phụ trách: ${teacher!.name} (Môn: ${teacher!.subject})');
    } else {
      print('Giáo viên phụ trách: Chưa có');
    }
    print('Danh sách học sinh (${students.length}):');
    for (var s in students) {
      print('  + [ID: ${s.id}] ${s.name} - Điểm: ${s.score}');
    }
  }
}

// 5. Chức năng chính
class QuanLyTruongHoc {
  List<Student> danhSachHocSinh = [];
  List<Teacher> danhSachGiaoVien = [];
  List<Classroom> danhSachLopHoc = [];

  // Quản lý danh sách học sinh và giáo viên
  void themHocSinh(Student s) => danhSachHocSinh.add(s);
  void themGiaoVien(Teacher t) => danhSachGiaoVien.add(t);
  void themLopHoc(Classroom c) => danhSachLopHoc.add(c);

  // Tính điểm trung bình của từng học sinh
  void tinhDiemTrungBinhTungHocSinh() {
    print('\n--- Điểm trung bình của từng học sinh ---');
    for (var s in danhSachHocSinh) {
      print(
        'Học sinh: ${s.name} (Lớp: ${s.grade}) - Điểm trung bình: ${s.score}',
      );
    }
  }

  // Gán giáo viên và học sinh vào lớp học
  void ganGiaoVienVaoLop(Teacher teacher, Classroom classroom) {
    classroom.ganGiaoVien(teacher);
  }

  void themHocSinhVaoLop(Student student, Classroom classroom) {
    classroom.themHocSinh(student);
  }

  // Hiển thị báo cáo danh sách lớp và điểm số
  void hienThiBaoCao() {
    print(
      '\n================ BÁO CÁO DANH SÁCH LỚP VÀ ĐIỂM SỐ ================',
    );
    for (var lop in danhSachLopHoc) {
      lop.hienThiThongTin();
      double tongDiem = 0;
      for (var s in lop.students) {
        tongDiem += s.score;
      }
      double dtbLop = lop.students.isNotEmpty
          ? tongDiem / lop.students.length
          : 0;
      print(
        '-> Điểm trung bình của lớp ${lop.name}: ${dtbLop.toStringAsFixed(2)}',
      );
    }
    print(
      '=================================================================\n',
    );
  }
}

void main() {
  QuanLyTruongHoc ql = QuanLyTruongHoc();

  // Tạo giáo viên
  Teacher gv1 = Teacher('GV01', 'Nguyễn Văn A', 35, 'Nam', 'Toán', 15000000);
  Teacher gv2 = Teacher('GV02', 'Trần Thị B', 30, 'Nữ', 'Văn', 14000000);
  ql.themGiaoVien(gv1);
  ql.themGiaoVien(gv2);

  // Tạo học sinh
  Student hs1 = Student('HS01', 'Phạm Minh C', 16, 'Nam', '10A1', 8.5);
  Student hs2 = Student('HS02', 'Lê Ngọc D', 16, 'Nữ', '10A1', 9.0);
  Student hs3 = Student('HS03', 'Hoàng Quốc E', 16, 'Nam', '10A2', 7.0);
  ql.themHocSinh(hs1);
  ql.themHocSinh(hs2);
  ql.themHocSinh(hs3);

  // Tạo lớp học
  Classroom lop1 = Classroom('LH01', '10A1');
  Classroom lop2 = Classroom('LH02', '10A2');
  ql.themLopHoc(lop1);
  ql.themLopHoc(lop2);

  // Gán giáo viên và học sinh vào lớp học
  ql.ganGiaoVienVaoLop(gv1, lop1);
  ql.ganGiaoVienVaoLop(gv2, lop2);

  ql.themHocSinhVaoLop(hs1, lop1);
  ql.themHocSinhVaoLop(hs2, lop1);
  ql.themHocSinhVaoLop(hs3, lop2);

  // Hiển thị thông tin mẫu
  print('--- Thông tin giáo viên và học sinh ---');
  gv1.hienThiThongTin();
  hs1.hienThiThongTin();

  // Tính điểm trung bình của từng học sinh
  ql.tinhDiemTrungBinhTungHocSinh();

  // Hiển thị báo cáo danh sách lớp và điểm số
  ql.hienThiBaoCao();
}
