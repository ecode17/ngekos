import 'package:flutter/material.dart';
import 'package:ngekos/screen/edit_product.dart';
import 'package:ngekos/screen/provider/product_model.dart'; // Import model produk untuk mengakses data produk

class ProductDetailPage extends StatelessWidget {
  final Product product; // Terima data produk dari halaman sebelumnya

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Produk'), // Judul halaman
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.namaProduk, // Tampilkan nama produk
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Harga: Rp. ${product.harga}', // Tampilkan harga produk
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Deskripsi: ${product.deskripsi}', // Tampilkan deskripsi produk
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman edit produk
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProductPage(product: product),
                  ),
                );
              },
              child: Text('Edit'), // Teks pada tombol edit
            ),
          ],
        ),
      ),
    );
  }
}
