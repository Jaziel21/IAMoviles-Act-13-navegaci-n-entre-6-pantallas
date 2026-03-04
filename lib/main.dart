import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Importación de tus 6 pantallas
import 'package:myapp/mispantallas/pantalla1.dart'; // Inicio
import 'package:myapp/mispantallas/pantalla2.dart'; // Registro
import 'package:myapp/mispantallas/pantalla3.dart'; // Login
import 'package:myapp/mispantallas/pantalla4.dart'; // Usuario
import 'package:myapp/mispantallas/pantalla5.dart'; // Ofertas
import 'package:myapp/mispantallas/pantalla6.dart'; // Confirmación

void main() {
  runApp(const LibreriaApp());
}

class LibreriaApp extends StatelessWidget {
  const LibreriaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Librería AJMG',
      
      // Configuración del tema oscuro profesional basado en tus capturas
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFFF1C40F), // Amarillo vibrante
        scaffoldBackgroundColor: const Color(0xFF0F172A), // Azul marino profundo
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFF1E293B),
          elevation: 0,
          titleTextStyle: GoogleFonts.oswald(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        textTheme: GoogleFonts.robotoTextTheme(ThemeData.dark().textTheme),
      ),

      // Definición de las 6 rutas principales
      initialRoute: '/',
      routes: {
        '/': (context) => const PantallaInicio(),          // Pantalla 1
        '/registro': (context) => const PantallaRegistro(), // Pantalla 2 (Directo desde inicio)
        '/login': (context) => const Pantalla3(),   // Pantalla 3
        '/usuario': (context) => const PantallaUsuario(),   // Pantalla 4
        '/ofertas': (context) => const PantallaOfertas(),   // Pantalla 5
        '/confirmacion': (context) => const PantallaConfirmacion(), // Pantalla 6
      },
    );
  }
}