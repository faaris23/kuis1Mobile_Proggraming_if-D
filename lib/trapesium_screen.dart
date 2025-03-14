import 'package:flutter/material.dart';

class TrapesiumScreen extends StatefulWidget {
  @override
  _TrapesiumScreenState createState() => _TrapesiumScreenState();
}

class _TrapesiumScreenState extends State<TrapesiumScreen> {
  final _aController = TextEditingController();
  final _bController = TextEditingController();
  final _hController = TextEditingController();
  final _s1Controller = TextEditingController();
  final _s2Controller = TextEditingController();
  double luas = 0;
  double keliling = 0;
  String errorMessage = '';

  void hitungTrapesium() {
    setState(() {
      errorMessage = '';
    });
    try {
      double a = double.parse(_aController.text);
      double b = double.parse(_bController.text);
      double h = double.parse(_hController.text);
      double s1 = double.parse(_s1Controller.text);
      double s2 = double.parse(_s2Controller.text);
      setState(() {
        luas = 0.5 * (a + b) * h;
        keliling = a + b + s1 + s2;
      });
    } catch (e) {
      setState(() {
        errorMessage =
            'Input tidak valid. Pastikan semua nilai diisi dengan angka.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Hitung Trapesium'),
        backgroundColor: isDarkMode ? Colors.black : Colors.blue,
        titleTextStyle: TextStyle(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (errorMessage.isNotEmpty)
              Text(errorMessage, style: TextStyle(color: Colors.red)),
            TextField(
              controller: _aController,
              decoration: InputDecoration(
                labelText: 'Panjang sisi atas (a)',
                labelStyle: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              keyboardType: TextInputType.number,
              style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
            ),
            TextField(
              controller: _bController,
              decoration: InputDecoration(
                labelText: 'Panjang sisi bawah (b)',
                labelStyle: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              keyboardType: TextInputType.number,
              style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
            ),
            TextField(
              controller: _hController,
              decoration: InputDecoration(
                labelText: 'Tinggi (h)',
                labelStyle: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              keyboardType: TextInputType.number,
              style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
            ),
            TextField(
              controller: _s1Controller,
              decoration: InputDecoration(
                labelText: 'Sisi miring 1 (s1)',
                labelStyle: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              keyboardType: TextInputType.number,
              style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
            ),
            TextField(
              controller: _s2Controller,
              decoration: InputDecoration(
                labelText: 'Sisi miring 2 (s2)',
                labelStyle: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              keyboardType: TextInputType.number,
              style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: hitungTrapesium,
              style: ElevatedButton.styleFrom(
                backgroundColor: isDarkMode ? Colors.grey[800] : Colors.blue,
              ),
              child: Text('Hitung', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),
            Text(
              'Luas Trapesium: $luas',
              style: TextStyle(
                fontSize: 18,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            Text(
              'Keliling Trapesium: $keliling',
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
