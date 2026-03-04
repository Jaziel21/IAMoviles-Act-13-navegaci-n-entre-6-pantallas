import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PantallaRegistro extends StatelessWidget {
  const PantallaRegistro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('LIBRERÍA AJMG', style: GoogleFonts.oswald(fontSize: 26, letterSpacing: 1.5)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          children: [
            Text('Registrarse', style: GoogleFonts.oswald(fontSize: 22, color: Colors.white70)),
            const SizedBox(height: 25),
            _campoRegistro('Nombre'),
            _campoRegistro('Correo electrónico'),
            _campoRegistro('Contraseña', ocultar: true),
            _campoRegistro('Confirmar contraseña', ocultar: true),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF1C40F),
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () => Navigator.pushNamed(context, '/usuario'),
              child: const Text('CREAR CUENTA', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            const SizedBox(height: 15),
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('← Volver al inicio', style: TextStyle(color: Colors.white54))),
          ],
        ),
      ),
    );
  }

  Widget _campoRegistro(String label, {bool ocultar = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 14)),
          const SizedBox(height: 8),
          TextField(
            obscureText: ocultar,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFF1E293B),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
            ),
          ),
        ],
      ),
    );
  }
}