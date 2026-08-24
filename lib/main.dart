import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calidad a su servicio',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // Pantallas asociadas a la barra de navegación inferior
  final List<Widget> _pages = [
    const HomeContent(),
    const ContactsScreen(),
    const PaymentsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calidad a su servicio',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      // Menú lateral funcional con rutas a pantallas específicas
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Color(0xFFEEEEEE)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Colors.orange, Colors.purple],
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'CV',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'BIBLIOTECA PÚBLICA',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.book, color: Colors.blue),
              title: const Text('Catálogo de Libros'),
              onTap: () {
                Navigator.pop(context); // Cierra el Drawer
                _navigateToDetail(context, 'Catálogo de Libros');
              },
            ),
            ListTile(
              leading: const Icon(Icons.access_time, color: Colors.blue),
              title: const Text('Reserva de Salas'),
              onTap: () {
                Navigator.pop(context);
                _navigateToDetail(context, 'Reserva de Salas');
              },
            ),
            ListTile(
              leading: const Icon(Icons.credit_card, color: Colors.blue),
              title: const Text('Mis Préstamos y Multas'),
              onTap: () {
                Navigator.pop(context);
                _navigateToDetail(context, 'Mis Préstamos y Multas');
              },
            ),
            ListTile(
              leading: const Icon(Icons.volume_up, color: Colors.blue),
              title: const Text('Eventos y Actividades'),
              onTap: () {
                Navigator.pop(context);
                _navigateToDetail(context, 'Eventos y Actividades');
              },
            ),
            ListTile(
              leading: const Icon(Icons.search, color: Colors.blue),
              title: const Text('Búsqueda Avanzada'),
              onTap: () {
                Navigator.pop(context);
                _navigateToDetail(context, 'Búsqueda Avanzada');
              },
            ),
            ListTile(
              leading: const Icon(Icons.help_outline, color: Colors.blue),
              title: const Text('Ayuda y Contacto'),
              onTap: () {
                Navigator.pop(context);
                _navigateToDetail(context, 'Ayuda y Contacto');
              },
            ),
          ],
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.phone), label: 'Contactos'),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Pagos'),
        ],
      ),
    );
  }

  // Función auxiliar para navegar hacia una pantalla de detalles genérica
  void _navigateToDetail(BuildContext context, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailScreen(title: title)),
    );
  }
}

// Contenido principal con Scroll
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            height: 110,
            width: 110,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Colors.orange, Colors.red, Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Center(
              child: Text(
                'CV',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          MenuOptionTile(
            icon: Icons.location_on,
            title: 'Dirección de envío',
            subtitle: 'Configura tu ubicación',
            onTap: () =>
                _showSnackBar(context, 'Seleccionaste: Dirección de envío'),
          ),
          const Divider(),
          MenuOptionTile(
            icon: Icons.shopping_bag,
            title: 'Compras',
            subtitle: 'Revisa tus pedidos recientes',
            onTap: () => _showSnackBar(context, 'Seleccionaste: Compras'),
          ),
          const Divider(),
          MenuOptionTile(
            icon: Icons.search,
            title: 'Búsqueda',
            subtitle: 'Encuentra libros y servicios',
            onTap: () =>
                _showSnackBar(context, 'Seleccionaste: Búsqueda rápida'),
          ),
          const SizedBox(height: 20),
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?auto=format&fit=crop&w=500&q=80',
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue[100],
                        foregroundColor: Colors.black87,
                        elevation: 0,
                      ),
                      onPressed: () {
                        _showSnackBar(
                          context,
                          '¡Botón Home de la tarjeta presionado!',
                        );
                      },
                      child: const Text('Home'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 1)),
    );
  }
}

// Widget auxiliar para las opciones interactivas
class MenuOptionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const MenuOptionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: Colors.grey, fontSize: 13),
      ),
      contentPadding: EdgeInsets.zero,
      onTap: onTap, // Acción al hacer clic
    );
  }
}

// Pantalla de Detalles genérica para las opciones del Drawer
class DetailScreen extends StatelessWidget {
  final String title;

  const DetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text(
          'Bienvenido a la sección de:\n$title',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// Pantalla de la pestaña Inferior: Contactos
class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.phone, size: 64, color: Colors.blue),
          SizedBox(height: 16),
          Text(
            'Sección de Contactos',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Línea de atención: +57 123 456 7890',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

// Pantalla de la pestaña Inferior: Pagos
class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.payment, size: 64, color: Colors.blue),
          SizedBox(height: 16),
          Text(
            'Sección de Pagos y Multas',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'No tienes pagos pendientes.',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
