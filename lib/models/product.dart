class Product{
  final int id;
  final String name;
  final double price;
  final int stock;


  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.stock,
  });


  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id:json['productId'] ?? json ['idProducto'] ?? 0,
      name: json['name'] ?? json['nombre'] ?? '',
      price: (json['price']?.toDouble() ?? json['precio_Venta'] ?? 0).toDouble(),
      stock: json['stock'] ?? json['cantidadStock'] ?? 0,
    );
  }
}