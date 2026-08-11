class Product {
  String name;
  double price;
  int quantity;

  Product({required this.name, required this.price, required this.quantity});

  // Phương thức hiển thị chi tiết sản phẩm
  void displayInfo() {
    print("Tên sản phẩm: $name | Giá: $price | Số lượng tồn kho: $quantity");
  }
}

class ProductManager {
  List<Product> products = [];

  // Thêm sản phẩm
  void addProduct(String name, double price, int quantity) {
    products.add(Product(name: name, price: price, quantity: quantity));
  }

  // Hiển thị danh sách sản phẩm
  void displayProducts() {
    if (products.isEmpty) {
      print("Kho hàng trống.");
      return;
    }
    print("\n--- DANH SÁCH SẢN PHẨM ---");
    for (int i = 0; i < products.length; i++) {
      print("${i + 1}. ");
      products[i].displayInfo();
    }
  }

  // Tìm kiếm sản phẩm theo tên
  void searchProduct(String keyword) {
    print("\n--- TÌM KIẾM SẢN PHẨM: '$keyword' ---");
    bool found = false;
    for (var p in products) {
      if (p.name.toLowerCase().contains(keyword.toLowerCase())) {
        p.displayInfo();
        found = true;
      }
    }

    if (!found) {
      print("Không tìm thấy sản phẩm nào phù hợp với từ khóa '$keyword'.");
    }
  }

  // Bán sản phẩm
  void sellProduct(String sellName, int sellQuantity) {
    print("\n--- BÁN SẢN PHẨM: '$sellName' (SL: $sellQuantity) ---");

    // Tìm sản phẩm theo tên
    Product? productToSell;
    for (var p in products) {
      if (p.name.toLowerCase() == sellName.toLowerCase()) {
        productToSell = p;
        break;
      }
    }

    if (productToSell == null) {
      print("Lỗi! Không tìm thấy sản phẩm '$sellName' trong kho.");
      return;
    }

    // Kiểm tra số lượng tồn kho
    if (sellQuantity > productToSell.quantity) {
      print(
        "Lỗi! Số lượng hàng trong kho không đủ (Chỉ còn ${productToSell.quantity}).",
      );
    } else {
      productToSell.quantity -= sellQuantity;
      print(
        "Bán thành công $sellQuantity '${productToSell.name}'. Số lượng tồn kho còn lại: ${productToSell.quantity}.",
      );
    }
  }
}

void main() {
  ProductManager manager = ProductManager();

  // 1. Thêm sản phẩm
  manager.addProduct("iPhone 14", 20000000, 10);
  manager.addProduct("Samsung Galaxy S23", 18000000, 5);
  manager.addProduct("MacBook Pro M2", 35000000, 2);

  // 2. Hiển thị danh sách sản phẩm
  manager.displayProducts();

  // 3. Tìm kiếm sản phẩm
  manager.searchProduct("iphone");
  manager.searchProduct("ipad");

  // 4. Bán sản phẩm
  manager.sellProduct("iPhone 14", 3);
  manager.sellProduct("MacBook Pro M2", 5); // Lỗi không đủ hàng
  manager.sellProduct("Nokia 1280", 1); // Lỗi không tìm thấy hàng

  print("\n Kết thúc chương trình.");
}
