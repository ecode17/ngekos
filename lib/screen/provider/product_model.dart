class Product {
  String namaProduk;
  String harga;
  String deskripsi;
  String imageUrl; // Tambahkan properti imageUrl untuk menyimpan URL gambar

  Product({
    required this.namaProduk,
    required this.harga,
    required this.deskripsi,
    required this.imageUrl,
  });

  // Konstruktor factory untuk mengkonversi JSON menjadi objek Product
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      namaProduk: json['nama_produk'] ?? 'Name Not Available',
      harga: json['harga'] ?? 0,
      deskripsi: json['deskripsi'] ?? 'Description Not Available',
      imageUrl: json['product_url'] ?? '',
    );
  }
}
