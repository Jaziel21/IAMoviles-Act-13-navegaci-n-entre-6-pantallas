import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PantallaOfertas extends StatelessWidget {
  const PantallaOfertas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CARRITO'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), 
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildSectionHeader('OFERTAS ESPECIALES', '– 20% en novelas solo hoy'),
          const SizedBox(height: 15),
          _buildOfferCard(context, 'NOVELA ROMÁNTICA', 'DESEO OSCURO', '\$250.00', const Color(0xFFF1C40F), 'assets/images/Captura.PNG'),
          const SizedBox(height: 30),
          _buildSectionHeader('OFERTA EDUCATIVA', 'Libros de idiomas y gramática'),
          const SizedBox(height: 15),
          _buildOfferCard(context, 'EDUCACIÓN', 'GRAMÁTICA INGLESA', 'Desde \$100.00', const Color(0xFF2ECC71), 'assets/images/Captura.PNG'),
          const SizedBox(height: 40),
          Center(
            child: TextButton(
              onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false),
              child: const Text('– VOLVER AL INICIO', style: TextStyle(color: Colors.white54, fontSize: 12)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: GoogleFonts.oswald(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
        const SizedBox(height: 4),
        Text(subtitle, style: const TextStyle(fontSize: 13, color: Colors.white70)),
      ],
    );
  }

  Widget _buildOfferCard(BuildContext context, String category, String title, String price, Color borderColor, String imagePath) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/confirmacion'),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(12),
          border: Border(left: BorderSide(color: borderColor, width: 8)),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(imagePath, width: 60, height: 80, fit: BoxFit.cover),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(category, style: TextStyle(color: borderColor, fontWeight: FontWeight.bold, fontSize: 12)),
                const SizedBox(height: 5),
                Text(title, style: GoogleFonts.oswald(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 5),
                Text(price, style: const TextStyle(fontSize: 16, color: Colors.white70)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}