import 'package:flutter/material.dart';
import 'package:ngekos/screen/provider/product_model.dart'; // Import model produk untuk mengakses data produk
import 'package:supabase_flutter/supabase_flutter.dart';

class EditProductPage extends StatefulWidget {
  final Product product; // Terima data produk dari halaman sebelumnya

  const EditProductPage({Key? key, required this.product}) : super(key: key);

  @override
  _EditProductPageState createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  late TextEditingController _namaController;
  late TextEditingController _hargaController;
  late TextEditingController _deskripsiController;

  @override
  void initState() {
    super.initState();
    _namaController = TextEditingController(text: widget.product.namaProduk);
    _hargaController = TextEditingController(text: widget.product.harga);
    _deskripsiController =
        TextEditingController(text: widget.product.deskripsi);
  }

  void saveProduct() async {
    // Dapatkan nilai teks yang dimasukkan oleh pengguna
    final updatedNamaProduk = _namaController.text;
    final updatedHarga = _hargaController.text;
    final updatedDeskripsi = _deskripsiController.text;

    // Perbarui atribut model produk dengan nilai baru
    widget.product.namaProduk = updatedNamaProduk;
    widget.product.harga = updatedHarga;
    widget.product.deskripsi = updatedDeskripsi;

    // Perbarui data produk di backend Supabase
    try {
      final response = await Supabase.instance.client.from('products').update({
        'nama_produk': updatedNamaProduk,
        'harga': updatedHarga,
        'deskripsi': updatedDeskripsi
      }).eq('id', widget.product);

      if (response.error != null) {
        throw response.error!;
      }

      // Kembali ke halaman sebelumnya setelah penyimpanan berhasil
      Navigator.pop(context);
    } catch (error) {
      print('Error updating product: $error');
      // Tampilkan pesan kesalahan kepada pengguna atau lakukan penanganan kesalahan lainnya
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Produk'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _namaController,
              decoration: InputDecoration(labelText: 'Nama Produk'),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _hargaController,
              decoration: InputDecoration(labelText: 'Harga'),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _deskripsiController,
              decoration: InputDecoration(labelText: 'Deskripsi'),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed:
                  saveProduct, // Panggil metode saveProduct saat tombol ditekan
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _namaController.dispose();
    _hargaController.dispose();
    _deskripsiController.dispose();
    super.dispose();
  }
}
