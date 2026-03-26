import 'package:flutter/material.dart';

void main() {
  runApp(const HotelMoonseaApp());
}

class HotelMoonseaApp extends StatelessWidget {
  const HotelMoonseaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel Luxury Moonsea',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1A237E),
          primary: const Color(0xFF1A237E),
          secondary: const Color(0xFFC5A059), // Color dorado lujo
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/productos': (context) => const GenericPage(
            title: 'Nuestros Productos', 
            imageUrl: 'https://images.unsplash.com/photo-1540555700478-4be289fbecef?q=80&w=800'),
        '/empleados': (context) => const GenericPage(
            title: 'Staff Moonsea', 
            imageUrl: 'https://images.unsplash.com/photo-1566073771259-6a8506099945?q=80&w=800'),
        '/mascotas': (context) => const GenericPage(
            title: 'Pet Friendly Services', 
            imageUrl: 'https://images.unsplash.com/photo-1583511655857-d19b40a7a54e?q=80&w=800'),
      },
    );
  }
}

// --- DRAWER CON MUCHO ESPACIO ---
class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.85, // Más ancho para elegancia
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            margin: EdgeInsets.zero,
            decoration: const BoxDecoration(
              color: Color(0xFF0D1231),
              image: DecorationImage(
                image: NetworkImage('https://images.unsplash.com/photo-1571896349842-33c89424de2d?q=80&w=800'),
                fit: BoxFit.cover,
                opacity: 0.3,
              ),
            ),
            currentAccountPicture: CircleAvatar(
  backgroundColor: Colors.white,
  child: Padding(
    padding: const EdgeInsets.all(2.0), // Aquí es donde va el espacio
    child: const CircleAvatar(
      backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/2784/2784554.png'),
    ),
  ),
),
            accountName: const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text('HOTEL LUXURY MOONSEA', 
                style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.bold, fontSize: 18)),
            ),
            accountEmail: const Text('📍 Calle Paraíso 777, Costa Azul\n📞 +34 900 123 456\n✉️ stay@moonsea.com'),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                children: [
                  _drawerItem(context, Icons.home_outlined, 'INICIO', '/'),
                  const Divider(indent: 20, endIndent: 20),
                  _drawerItem(context, Icons.shopping_bag_outlined, 'PRODUCTOS', '/productos'),
                  _drawerItem(context, Icons.people_outline, 'EMPLEADOS', '/empleados'),
                  _drawerItem(context, Icons.pets_outlined, 'MASCOTAS', '/mascotas'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawerItem(BuildContext context, IconData icon, String label, String route) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10), // Mucho espacio
      leading: Icon(icon, color: const Color(0xFFC5A059)),
      title: Text(label, style: const TextStyle(letterSpacing: 1.5, fontWeight: FontWeight.w500)),
      onTap: () => Navigator.pushReplacementNamed(context, route),
    );
  }
}

// --- HOME PAGE ---
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MOONSEA LUXURY', style: TextStyle(letterSpacing: 3)),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0), // Espaciado masivo lateral
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network('https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?q=80&w=1000'),
              ),
              const SizedBox(height: 40),
              const Text('BIENVENIDO AL PARAÍSO', 
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w300, letterSpacing: 4)),
              const SizedBox(height: 20),
              const Text('Disfrute de una experiencia inigualable frente al mar.', 
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}

// --- PÁGINAS GENÉRICAS CON IMAGEN 200X200 ---
class GenericPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  const GenericPage({super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title.toUpperCase())),
      drawer: const CustomDrawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0), // Espacio alrededor del contenido
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 20, offset: Offset(0, 10))]
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imageUrl,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 60), // Gran espacio entre imagen y texto
              Text(title, 
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1A237E))),
              const SizedBox(height: 20),
              const Text('Explora nuestros servicios exclusivos diseñados para tu confort.',
                textAlign: TextAlign.center,
                style: TextStyle(height: 1.5, color: Colors.blueGrey)),
            ],
          ),
        ),
      ),
    );
  }
}