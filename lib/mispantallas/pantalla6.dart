import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PantallaConfirmacion extends StatelessWidget {
  const PantallaConfirmacion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CARRITO'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), 
          onPressed: () => Navigator.pop(context),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.check_circle, color: Color(0xFF2ECC71), size: 28),
                  const SizedBox(width: 12),
                  Text('Compra realizada con éxito!', style: GoogleFonts.oswald(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 30),
              _buildPurchasedItem('assets/images/Captura.PNG', 'HÁBITOS ATÓMICOS', 'James Clear'),
              const SizedBox(height: 30),
              const Divider(color: Colors.white24),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total pagado:', style: TextStyle(fontSize: 18, color: Colors.white.withOpacity(0.8))),
                  const Text('\$250.00', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                ],
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF1C40F), 
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false),
                child: const Text('VOLVER AL INICIO', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
              ),
              const SizedBox(height: 10), // Margen inferior
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPurchasedItem(String imagePath, String title, String author) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
        border: const Border(left: BorderSide(color: Color(0xFFF1C40F), width: 6)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(imagePath, width: 50, height: 70, fit: BoxFit.cover),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: GoogleFonts.oswald(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
              const SizedBox(height: 5),
              Text(author, style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.7))),
            ],
          ),
        ],
      ),
    );
  }
}