import 'package:flutter/material.dart';

class KubusScreen extends StatefulWidget {
  @override
  _KubusScreenState createState() => _KubusScreenState();
}

class _KubusScreenState extends State<KubusScreen> {
  final _sisiController = TextEditingController();
  double volume = 0;
  double keliling = 0;
  String errorMessage = '';

  void hitungKubus() {
    setState(() {
      errorMessage = '';
      try {
        double s = double.parse(_sisiController.text);
        volume = s * s * s;
        keliling = 12 * s;
      } catch (e) {
        errorMessage = 'Input tidak valid. Masukkan angka yang benar.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Hitung Kubus'),
        backgroundColor: isDarkMode ? Colors.black : Colors.blue,
        titleTextStyle: TextStyle(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _sisiController,
              decoration: InputDecoration(
                labelText: 'Panjang sisi',
                labelStyle: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
                errorText: errorMessage.isEmpty ? null : errorMessage,
              ),
              keyboardType: TextInputType.number,
              style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: hitungKubus,
              style: ElevatedButton.styleFrom(
                backgroundColor: isDarkMode ? Colors.grey[800] : Colors.blue,
              ),
              child: Text('Hitung', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),
            Text(
              'Volume Kubus: $volume',
              style: TextStyle(
                fontSize: 18,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            Text(
              'Keliling Kubus: $keliling',
              style: TextStyle(
                fontSize: 18,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
    );
  }
}
