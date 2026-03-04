
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PantallaUsuario extends StatelessWidget {
  const PantallaUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(children: [
        Text('LIBRERIA AJMG', style: GoogleFonts.oswald())
      ])),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(child: Text('Mi cuenta', style: GoogleFonts.oswald(fontSize: 28))),
              const Divider(height: 20, color: Colors.white24), // Separator line
              const SizedBox(height: 10),
              const ListTile(
                leading: CircleAvatar(
                    backgroundColor: Color(0xFFF1C40F),
                    child: Icon(Icons.person, color: Colors.black)),
                title: Text('Juan Pérez',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                // Subtitle with email removed
              ),
              const Divider(height: 40, color: Colors.white24),
              const Text('Libros comprados:',
                  style: TextStyle(color: Colors.white70)),
              const SizedBox(height: 15),
              _libroFila('Hábitos Atómicos', 'James Clear', 'assets/images/Captura.PNG'), // Added image path
              const SizedBox(height: 20),
              ListTile(
                  leading:
                      const Icon(Icons.local_offer, color: Color(0xFFF1C40F)),
                  title: const Text('Ver Ofertas'),
                  onTap: () => Navigator.pushNamed(context, '/ofertas')),
              ListTile(
                  leading: const Icon(Icons.logout, color: Colors.redAccent),
                  title: const Text('Cerrar sesión'),
                  onTap: () => Navigator.pushNamedAndRemoveUntil(
                      context, '/', (r) => false)),
              const SizedBox(height: 10),
              InkWell(
                onTap: () => Navigator.pushNamed(context, '/'),
                child: const Row(
                  children: [
                    Icon(Icons.arrow_back, color: Colors.white),
                    SizedBox(width: 8),
                    Text('Volver al inicio'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _libroFila(String t, String a, String imagePath) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(8)),
      child: Row(children: [
        Image.asset(
          imagePath,
          width: 50, // Specify image width
          height: 70, // Specify image height
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 15),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(t),
              Text(a, style: const TextStyle(fontSize: 12, color: Colors.white54))
            ])
      ]),
    );
  }
}
