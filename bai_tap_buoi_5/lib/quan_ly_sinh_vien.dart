import 'dart:io';

void main() {
  //NHẬP THÔNG TIN NHÂN VIÊN
  stdout.write('Nhập họ tên nhân viên: ');
  String hoTen = stdin.readLineSync() ?? '';

  stdout.write('Nhập số giờ làm việc: ');
  double soGioLam = double.parse(stdin.readLineSync() ?? '0');

  stdout.write('Nhập lương mỗi giờ: ');
  double luongMoiGio = double.parse(stdin.readLineSync() ?? '0');

  //TÍNH TỔNG LƯƠNG
  double tongLuong = soGioLam * luongMoiGio;

  //  THÊM PHỤ CẤP
  // Nếu làm hơn 40 giờ, nhân viên nhận thêm 20% tổng lương
  if (soGioLam > 40) {
    double phuCap = tongLuong * 0.2;
    tongLuong += phuCap;
    print('Phụ cấp làm thêm giờ (20%): ${phuCap.toStringAsFixed(0)} VND');
  }

  //TÍNH THUẾ THU NHẬP
  double thueThuNhap = 0;

  if (tongLuong > 10000000) {
    // Lương trên 10 triệu: trừ 10%
    thueThuNhap = tongLuong * 0.1;
  } else if (tongLuong >= 7000000) {
    // Lương từ 7 đến 10 triệu: trừ 5%
    thueThuNhap = tongLuong * 0.05;
  } else {
    // Lương dưới 7 triệu: không trừ
    thueThuNhap = 0;
  }

  //TÍNH LƯƠNG THỰC LÃNH
  double luongThucLanh = tongLuong - thueThuNhap;

  print('\n====================================');
  print('   BẢNG LƯƠNG NHÂN VIÊN');
  print('====================================');
  print('Họ tên:              $hoTen');
  print('Số giờ làm việc:     ${soGioLam.toStringAsFixed(0)} giờ');
  print('Lương mỗi giờ:       ${luongMoiGio.toStringAsFixed(0)} VND');
  print('------------------------------------');
  print('Tổng lương trước thuế: ${tongLuong.toStringAsFixed(0)} VND');
  print('Thuế thu nhập:         ${thueThuNhap.toStringAsFixed(0)} VND');
  print('Lương thực lãnh:       ${luongThucLanh.toStringAsFixed(0)} VND');
  print('====================================');
}
