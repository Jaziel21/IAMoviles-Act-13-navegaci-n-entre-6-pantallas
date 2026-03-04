import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// --------- Hover Effect Widget Definition ---------
class HoverableWidget extends StatefulWidget {
  final Widget child;
  const HoverableWidget({Key? key, required this.child}) : super(key: key);

  @override
  _HoverableWidgetState createState() => _HoverableWidgetState();
}

class _HoverableWidgetState extends State<HoverableWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: _isHovered
            ? (Matrix4.identity()..scale(1.05))
            : Matrix4.identity(),
        transformAlignment: Alignment.center,
        child: widget.child,
      ),
    );
  }

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
}
// --------------------------------------------------

class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes the default back button or menu icon
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.menu_book, color: Color(0xFFF1C40F), size: 30), // Icon size increased
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'LIBRERÍA AJMG - Alfredo Martinez 6 I', // Title updated
                style: GoogleFonts.oswald(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        actions: [], // Removed the shopping cart icon from the app bar
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // -- START NON-SCROLLABLE TOP PART --
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Buscar libro...',
                prefixIcon: const Icon(Icons.search, color: Color(0xFFF1C40F)),
                filled: true,
                fillColor: const Color(0xFF1E293B),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Categories Nav
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Inicio'),
                _buildVerticalDivider(),
                const Text('Categorías'),
                _buildVerticalDivider(),
                HoverableWidget(
                  child: IconButton(
                    icon: const Icon(Icons.shopping_cart, size: 20),
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Libros Destacados Title
            Row(
              children: [
                const Icon(Icons.star, color: Color(0xFFF1C40F), size: 20),
                const SizedBox(width: 8),
                Text(
                  'LIBROS DESTACADOS',
                  style: GoogleFonts.oswald(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            // -- END NON-SCROLLABLE TOP PART --

            // -- START SCROLLABLE LIST --
            Expanded(
              child: ListView(
                children: [
                  _itemLibro(context, 'HÁBITOS ATÓMICOS', '\$250', 'assets/images/Captura.PNG'),
                  _itemLibro(context, 'DESEO OSCURO', '\$180', 'assets/images/Captura1.PNG'),
                  _itemLibro(context, 'MÉXICO EN LLAMAS', '\$200', 'assets/images/Captura4.PNG'),
                  _itemLibro(context, 'GRAMÁTICA INGLESA', '\$150', 'assets/images/Captura5.PNG'),
                ],
              ),
            ),
            // -- END SCROLLABLE LIST --

            // -- START FIXED BOTTOM PART --
            const SizedBox(height: 20),
            // Iniciar Sesion Button
            HoverableWidget(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E293B),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () => Navigator.pushNamed(context, '/login'),
                child: const Text('Iniciar Sesión'),
              ),
            ),
            const SizedBox(height: 15),

            // Footer Nav
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HoverableWidget(
                  child: TextButton(
                      onPressed: () => Navigator.pushNamed(context, '/ofertas'),
                      child: const Text('Ofertas', style: TextStyle(color: Colors.white70))),
                ),
                _buildVerticalDivider(),
                HoverableWidget(
                  child: TextButton(
                      onPressed: () {},
                      child: const Text('Contacto', style: TextStyle(color: Colors.white70))),
                ),
              ],
            ),
            // -- END FIXED BOTTOM PART --
          ],
        ),
      ),
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      height: 14,
      width: 1,
      color: Colors.white54,
      margin: const EdgeInsets.symmetric(horizontal: 10),
    );
  }

  Widget _itemLibro(
      BuildContext context, String titulo, String precio, String imagePath) {
    return HoverableWidget( // Wrap the whole book item
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/ofertas'), // Make the whole card tappable
        child: Container(
          margin: const EdgeInsets.only(bottom: 15),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF1E293B),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              // Placeholder for image if it fails to load
              Image.asset(
                imagePath,
                width: 40, 
                height: 60, 
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 40,
                    height: 60,
                    color: Colors.grey[800],
                    child: const Icon(Icons.book, color: Colors.grey),
                  );
                },
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(titulo,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(width: 10),
              Row( // Row for price and button
                children: [
                  Text(precio,
                      style: const TextStyle(
                          fontSize: 14, color: Color(0xFFF1C40F))),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF1C40F).withOpacity(0.8),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    ),
                    onPressed: () => Navigator.pushNamed(context, '/ofertas'),
                    child: const Text('Ver'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}