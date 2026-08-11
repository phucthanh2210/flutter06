import 'dart:io';

void main() {
  // NHẬP THÔNG TIN HÓA ĐƠN
  stdout.write('Nhập tên sản phẩm: ');
  String tenSanPham = stdin.readLineSync() ?? '';

  stdout.write('Nhập số lượng mua: ');
  int soLuongmua = int.parse(stdin.readLineSync() ?? '0');

  stdout.write('Nhập đơn giá: ');
  double donGia = double.parse(stdin.readLineSync() ?? '0');

  //TÍNH THÀNH TIỀN
  double thanhTien = soLuongmua * donGia;

  //ÁP DỤNG GIẢM GIÁ
  double giamGia = 0;

  if (thanhTien >= 1000000) {
    // Thành tiền >= 1,000,000: giảm giá 10%
    giamGia = thanhTien * 0.1;
  } else if (thanhTien >= 500000) {
    // Thành tiền từ 500,000 đến dưới 1,000,000: giảm giá 5%
    giamGia = thanhTien * 0.05;
  } else {
    // Dưới 500,000: không giảm giá
    giamGia = 0;
  }

  double tongSauGiamGia = thanhTien - giamGia;

  //TÍNH THUẾ VAT 8%
  double thueVAT = tongSauGiamGia * 0.08;

  //TỔNG THANH TOÁN CUỐI CÙNG
  double tongThanhToan = tongSauGiamGia + thueVAT;

  // IN HÓA ĐƠN
  print('\n==========================================');
  print('           HÓA ĐƠN BÁN HÀNG');
  print('==========================================');
  print('Tên sản phẩm:       $tenSanPham');
  print('Số lượng mua:            $soLuongmua');
  print('Đơn giá:             ${donGia.toStringAsFixed(0)} VND');
  print('------------------------------------------');
  print('Thành tiền:          ${thanhTien.toStringAsFixed(0)} VND');
  print('Giảm giá:            ${giamGia.toStringAsFixed(0)} VND');
  print('Thuế VAT (8%):       ${thueVAT.toStringAsFixed(0)} VND');
  print('------------------------------------------');
  print('Tổng thanh toán:     ${tongThanhToan.toStringAsFixed(0)} VND');
  print('==========================================');
}
