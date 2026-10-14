
// 1. Hàm thêm sản phẩm vào giỏ hàng
void addProduct(
  List<Map<String, dynamic>> cart,
  String name,
  int quantity,
  double price,
) {
  if (quantity <= 0 || price < 0) {
    print('❌ Số lượng phải lớn hơn 0 và giá tiền không được âm!');
    return;
  }

  // Kiểm tra nếu sản phẩm đã tồn tại trong giỏ hàng thì cộng dồn số lượng
  int existingIndex = cart.indexWhere(
    (item) => item['name'].toString().toLowerCase() == name.toLowerCase(),
  );

  if (existingIndex != -1) {
    cart[existingIndex]['quantity'] += quantity;
    cart[existingIndex]['price'] = price; // Cập nhật lại đơn giá mới nếu có
    print('🔄 Đã cộng dồn số lượng cho sản phẩm "$name".');
  } else {
    cart.add({
      'name': name,
      'quantity': quantity,
      'price': price,
    });
    print('✅ Đã thêm sản phẩm "$name" vào giỏ hàng.');
  }
}

// 2. Hàm sửa thông tin sản phẩm trong giỏ hàng
void editProduct(
  List<Map<String, dynamic>> cart,
  String name, {
  int? newQuantity,
  double? newPrice,
}) {
  int index = cart.indexWhere(
    (item) => item['name'].toString().toLowerCase() == name.toLowerCase(),
  );

  if (index == -1) {
    print('❌ Không tìm thấy sản phẩm "$name" trong giỏ hàng để sửa!');
    return;
  }

  if (newQuantity != null) {
    if (newQuantity <= 0) {
      print('❌ Số lượng mới phải lớn hơn 0!');
      return;
    }
    cart[index]['quantity'] = newQuantity;
  }

  if (newPrice != null) {
    if (newPrice < 0) {
      print('❌ Giá tiền mới không được âm!');
      return;
    }
    cart[index]['price'] = newPrice;
  }

  print('✏️ Đã cập nhật thông tin sản phẩm "${cart[index]['name']}".');
}

// 2b. Hàm xóa sản phẩm khỏi giỏ hàng
void removeProduct(List<Map<String, dynamic>> cart, String name) {
  int initialLength = cart.length;
  cart.removeWhere(
    (item) => item['name'].toString().toLowerCase() == name.toLowerCase(),
  );

  if (cart.length < initialLength) {
    print('🗑️ Đã xóa sản phẩm "$name" khỏi giỏ hàng.');
  } else {
    print('❌ Không tìm thấy sản phẩm "$name" trong giỏ hàng để xóa!');
  }
}

// 3. Hàm hiển thị thông tin giỏ hàng
void displayCart(List<Map<String, dynamic>> cart) {
  print('\n------------------- 🛒 GIỎ HÀNG CHUYÊN NGHIỆP -------------------');
  if (cart.isEmpty) {
    print('Giỏ hàng đang trống!');
    print('------------------------------------------------------------------\n');
    return;
  }

  print(
    'STT | ${'Tên sản phẩm'.padRight(20)} | ${'Số lượng'.padLeft(8)} | ${'Đơn giá (VNĐ)'.padLeft(14)} | ${'Thành tiền (VNĐ)'.padLeft(16)}',
  );
  print('-' * 70);

  for (int i = 0; i < cart.length; i++) {
    String name = cart[i]['name'];
    int quantity = cart[i]['quantity'];
    double price = cart[i]['price'];
    double itemTotal = quantity * price;

    print(
      '${(i + 1).toString().padRight(3)} | ${name.padRight(20)} | ${quantity.toString().padLeft(8)} | ${price.toStringAsFixed(0).padLeft(14)} | ${itemTotal.toStringAsFixed(0).padLeft(16)}',
    );
  }
  print('------------------------------------------------------------------');
}

// 4. Hàm tính tổng tiền hóa đơn
double calculateTotal(List<Map<String, dynamic>> cart) {
  double total = 0.0;
  for (var item in cart) {
    total += (item['quantity'] as int) * (item['price'] as double);
  }
  return total;
}

void main() {
  // Khởi tạo giỏ hàng dạng List<Map<String, dynamic>>
  List<Map<String, dynamic>> shoppingCart = [];

  print('================ CHƯƠNG TRÌNH QUẢN LÝ HÓA ĐƠN ================');

  // --- 1. Thêm các sản phẩm mẫu vào giỏ hàng ---
  print('\n--- 1. THÊM SẢN PHẨM VÀO GIỎ HÀNG ---');
  addProduct(shoppingCart, 'iPhone 15 Pro Max', 1, 30000000);
  addProduct(shoppingCart, 'Laptop Dell XPS', 2, 25000000);
  addProduct(shoppingCart, 'Tai nghe Sony WH-1000XM5', 3, 8000000);

  // Hiển thị giỏ hàng ban đầu
  displayCart(shoppingCart);

  // --- 2. Sửa sản phẩm ---
  print('\n--- 2. SỬA SẢN PHẨM TRONG GIỎ HÀNG ---');
  // Thay đổi số lượng của Laptop Dell XPS từ 2 thành 1 và giá mới
  editProduct(shoppingCart, 'Laptop Dell XPS', newQuantity: 1, newPrice: 24500000);
  displayCart(shoppingCart);

  // --- 3. Xóa sản phẩm ---
  print('\n--- 3. XÓA SẢN PHẨM KHỎI GIỎ HÀNG ---');
  removeProduct(shoppingCart, 'Tai nghe Sony WH-1000XM5');
  displayCart(shoppingCart);

  // --- 4. Tính và hiển thị tổng tiền hóa đơn ---
  print('\n--- 4. TÍNH TỔNG TIỀN HÓA ĐƠN ---');
  double grandTotal = calculateTotal(shoppingCart);
  print('🧾 TỔNG TIỀN PHẢI THANH TOÁN: ${grandTotal.toStringAsFixed(0)} VNĐ');
  print('==============================================================');
}
