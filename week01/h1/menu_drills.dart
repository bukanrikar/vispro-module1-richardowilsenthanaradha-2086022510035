class MenuItem {
  final String name;
  final double price;
  final double? discountPercent;

  MenuItem({required this.name, required this.price, this.discountPercent});

  double finalPrice() {
    final discount = discountPercent ?? 0.0;
    return price * (1 - (discount / 100));
  }
}

void main() {
  final List<MenuItem> menuItems = [
    MenuItem(name: 'Nasi Goreng', price: 20000),
    MenuItem(name: 'Es Teh Manis', price: 5000, discountPercent: 10),
    MenuItem(name: 'Ayam Goreng', price: 18000),
    MenuItem(name: 'Krupuk', price: 2000),
    MenuItem(name: 'Kopi Susu', price: 15000, discountPercent: 20),
  ];

  final allNames = menuItems.map((item) => item.name).toList();
  print('Semua Menu: $allNames');
  final cheapItems = menuItems
      .where((item) => item.finalPrice() < 15000)
      .toList();
  print('Menu di bawah Rp 15.000: ${cheapItems.map((e) => e.name).join(', ')}');
  final totalPrice = menuItems.fold<double>(
    0.0,
    (sum, item) => sum + item.finalPrice(),
  );
  print('Total Harga: Rp ${totalPrice.toStringAsFixed(0)}');
}
