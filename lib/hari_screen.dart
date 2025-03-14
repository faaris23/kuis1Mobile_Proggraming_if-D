import 'package:flutter/material.dart';

class HariScreen extends StatefulWidget {
  @override
  _HariScreenState createState() => _HariScreenState();
}

class _HariScreenState extends State<HariScreen> {
  final _angkaController = TextEditingController();
  String hari = '';
  String errorMessage = ''; // Add error message state

  void hitungHari() {
    setState(() {
      errorMessage = ''; // Reset error message
    });
    try {
      int angka = int.parse(_angkaController.text);
      List<String> hariList = [
        'Senin',
        'Selasa',
        'Rabu',
        'Kamis',
        'Jumat',
        'Sabtu',
        'Minggu',
      ];
      if (angka >= 1 && angka <= 7) {
        setState(() {
          hari = hariList[angka - 1];
        });
      } else {
        setState(() {
          hari = 'Input tidak valid';
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Input harus berupa angka';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Penghitung Hari'),
        backgroundColor: isDarkMode ? Colors.black : Colors.blue,
        titleTextStyle: TextStyle(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _angkaController,
              decoration: InputDecoration(
                labelText: 'Masukkan angka (1-7)',
                labelStyle: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
                errorText:
                    errorMessage.isEmpty
                        ? null
                        : errorMessage, // Display error message
              ),
              keyboardType: TextInputType.number,
              style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: hitungHari,
              style: ElevatedButton.styleFrom(
                backgroundColor: isDarkMode ? Colors.grey[800] : Colors.blue,
              ),
              child: Text('Cari Hari', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),
            Text(
              'Hari: $hari',
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
