import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sports Store',
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.dark,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => WelcomePage(),
        "/login": (context) => LoginPage(),
        "/menu": (context) => MenuPage(),
        "/home": (context) => HomePage(),
        "/settings": (context) => SettingsPage(),
      },
    );
  }
}

// Lista global de productos con categorías
List<Product> productList = [
  Product(name: 'Balón Nike Premier League', price: 89.99, category: 'Balones'),
  Product(name: 'Zapatillas Adidas Predator', price: 199.99, category: 'Zapatillas'),
  Product(name: 'Guantes de Portero Puma', price: 45.50, category: 'Accesorios'),
  Product(name: 'Camiseta Manchester United', price: 75.00, category: 'Camisetas'),
  Product(name: 'Raqueta Wilson Pro Staff', price: 249.99, category: 'Raquetas'),
  Product(name: 'Bicicleta Trek Mountain', price: 1299.00, category: 'Bicicletas'),
  Product(name: 'Polo Deportivo Nike', price: 45.00, category: 'Polos'),
  Product(name: 'Pantalón Adidas Training', price: 65.00, category: 'Pantalones'),
  Product(name: 'Short Puma Running', price: 35.00, category: 'Pantalones'),
];

// ==================== WELCOME PAGE ====================
class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );
    
    _controller.forward();
    
    // Navegar al login después de 3 segundos
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, "/login");
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF2D1B3D),
              Color(0xFF8B4F6F),
              Color(0xFFD17B7B),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo animado
                    Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFFF9A76),
                            Color(0xFFFF7B7B),
                            Color(0xFFE86B6B),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFFF7B7B).withOpacity(0.6),
                            blurRadius: 50,
                            spreadRadius: 15,
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.sports_soccer,
                        size: 90,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 40),
                    
                    Text(
                      'BIENVENIDO',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 6,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 15),
                    
                    Text(
                      'SPORTS STORE',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 4,
                        color: Color(0xFFFF9A76),
                      ),
                    ),
                    SizedBox(height: 30),
                    
                    // Indicador de carga
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFF9A76)),
                      strokeWidth: 3,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ==================== LOGIN PAGE ====================
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF2D1B3D),
              Color(0xFF8B4F6F),
              Color(0xFFD17B7B),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo decorativo
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFFF9A76),
                            Color(0xFFFF7B7B),
                            Color(0xFFE86B6B),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFFF7B7B).withOpacity(0.5),
                            blurRadius: 40,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          // Sombras decorativas
                          Positioned(
                            bottom: 40,
                            left: 30,
                            child: Container(
                              width: 60,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Color(0xFF6B4F5F).withOpacity(0.6),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 50,
                            right: 35,
                            child: Container(
                              width: 45,
                              height: 22,
                              decoration: BoxDecoration(
                                color: Color(0xFF6B4F5F).withOpacity(0.4),
                                borderRadius: BorderRadius.circular(22),
                              ),
                            ),
                          ),
                          Center(
                            child: Icon(
                              Icons.shopping_bag,
                              size: 70,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    
                    // Título
                    Text(
                      'SPORTS STORE',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 6,
                        color: Color(0xFFFF9A76),
                      ),
                    ),
                    SizedBox(height: 50),
                    
                    // Card del formulario
                    Container(
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xFFD17B7B).withOpacity(0.9),
                            Color(0xFFC76B6B).withOpacity(0.9),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'LOGIN',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 30),
                          
                          // Email field
                          TextField(
                            controller: _emailController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(color: Colors.white70),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white54),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white, width: 2),
                              ),
                              prefixIcon: Icon(Icons.email_outlined, color: Colors.white70),
                            ),
                          ),
                          SizedBox(height: 20),
                          
                          // Password field
                          TextField(
                            controller: _passwordController,
                            obscureText: true,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Colors.white70),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white54),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white, width: 2),
                              ),
                              prefixIcon: Icon(Icons.lock_outline, color: Colors.white70),
                            ),
                          ),
                          SizedBox(height: 40),
                          
                          // Login button
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, "/menu");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 5,
                            ),
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                color: Color(0xFFD17B7B),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

// ==================== MENU PAGE ====================
class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF2D1B3D),
              Color(0xFF8B4F6F),
              Color(0xFFD17B7B),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  // Logo
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFFFF9A76),
                          Color(0xFFFF7B7B),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFFF7B7B).withOpacity(0.5),
                          blurRadius: 30,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.shopping_bag,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  
                  Text(
                    'MENU',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 50),
                  
                  // Menu Options
                  _buildMenuButton(
                    context,
                    icon: Icons.home,
                    title: 'Home',
                    subtitle: 'Ver productos disponibles',
                    onTap: () {
                      Navigator.pushNamed(context, "/home");
                    },
                  ),
                  SizedBox(height: 20),
                  
                  _buildMenuButton(
                    context,
                    icon: Icons.person,
                    title: 'Profile',
                    subtitle: 'Información de usuario',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Perfil - Próximamente')),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  
                  _buildMenuButton(
                    context,
                    icon: Icons.settings,
                    title: 'Settings',
                    subtitle: 'Agregar nuevos productos',
                    onTap: () {
                      Navigator.pushNamed(context, "/settings");
                    },
                  ),
                  SizedBox(height: 20),
                  
                  _buildMenuButton(
                    context,
                    icon: Icons.logout,
                    title: 'Logout',
                    subtitle: 'Cerrar sesión',
                    color: Color(0xFFE86B6B),
                    onTap: () {
                      _showLogoutDialog(context);
                    },
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFFC76B6B),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: Color(0xFFFF9A76), size: 28),
              SizedBox(width: 10),
              Text(
                'Cerrar Sesión',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: Text(
            '¿Estás seguro de que deseas cerrar sesión?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
              child: Text(
                'Cancelar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
                Navigator.pushReplacementNamed(context, "/login"); // Ir al login
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Sí, cerrar',
                style: TextStyle(
                  color: Color(0xFFE86B6B),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildMenuButton(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    Color? color,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: color != null
              ? [color, color.withOpacity(0.8)]
              : [
                  Color(0xFFD17B7B).withOpacity(0.9),
                  Color(0xFFC76B6B).withOpacity(0.9),
                ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: Colors.white, size: 30),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ==================== HOME PAGE (Con Categorías y Colores Consistentes) ====================
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'Todos';
  
  final Map<String, IconData> categoryIcons = {
    'Todos': Icons.grid_view,
    'Polos': Icons.checkroom,
    'Camisetas': Icons.sports_soccer,
    'Pantalones': Icons.dry_cleaning,
    'Zapatillas': Icons.sports_basketball,
    'Balones': Icons.sports_soccer,
    'Accesorios': Icons.sports_handball,
    'Raquetas': Icons.sports_tennis,
    'Bicicletas': Icons.directions_bike,
  };

  List<Product> getFilteredProducts() {
    if (selectedCategory == 'Todos') {
      return productList;
    }
    return productList.where((product) => product.category == selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos Deportivos'),
        centerTitle: true,
        backgroundColor: Color(0xFF2D1B3D),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF2D1B3D),
              Color(0xFF8B4F6F),
              Color(0xFFD17B7B),
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 15),
            
            // Título de categorías
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Icon(Icons.category, color: Colors.white, size: 20),
                  SizedBox(width: 8),
                  Text(
                    'Categorías',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            
            // Grid de categorías
            Container(
              height: 200,
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 15),
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemCount: categoryIcons.length,
                itemBuilder: (context, index) {
                  String category = categoryIcons.keys.elementAt(index);
                  IconData icon = categoryIcons[category]!;
                  bool isSelected = selectedCategory == category;
                  
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: isSelected
                            ? LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFFFF9A76),
                                  Color(0xFFFF7B7B),
                                ],
                              )
                            : LinearGradient(
                                colors: [
                                  Color(0xFFD17B7B).withOpacity(0.7),
                                  Color(0xFFC76B6B).withOpacity(0.7),
                                ],
                              ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: isSelected 
                                ? Color(0xFFFF7B7B).withOpacity(0.4)
                                : Colors.black12,
                            blurRadius: isSelected ? 15 : 8,
                            spreadRadius: isSelected ? 2 : 1,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              icon,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            category,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            
            SizedBox(height: 15),
            
            // Divisor
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              height: 1,
              color: Colors.white.withOpacity(0.3),
            ),
            
            SizedBox(height: 10),
            
            // Lista de productos filtrados
            Expanded(
              child: getFilteredProducts().isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.inventory_2_outlined,
                            size: 60,
                            color: Colors.white.withOpacity(0.5),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'No hay productos en esta categoría',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.all(15),
                      itemCount: getFilteredProducts().length,
                      itemBuilder: (context, index) {
                        return _buildProductCard(getFilteredProducts()[index]);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    // Iconos dinámicos según el tipo de producto
    IconData productIcon = Icons.sports_soccer;
    
    if (product.name.toLowerCase().contains('balón') || 
        product.name.toLowerCase().contains('balon')) {
      productIcon = Icons.sports_soccer;
    } else if (product.name.toLowerCase().contains('zapatilla') || 
               product.name.toLowerCase().contains('zapato')) {
      productIcon = Icons.sports_basketball;
    } else if (product.name.toLowerCase().contains('guante')) {
      productIcon = Icons.sports_handball;
    } else if (product.name.toLowerCase().contains('camiseta') || 
               product.name.toLowerCase().contains('jersey')) {
      productIcon = Icons.checkroom;
    } else if (product.name.toLowerCase().contains('raqueta')) {
      productIcon = Icons.sports_tennis;
    } else if (product.name.toLowerCase().contains('bicicleta') || 
               product.name.toLowerCase().contains('bike')) {
      productIcon = Icons.directions_bike;
    } else if (product.name.toLowerCase().contains('polo')) {
      productIcon = Icons.checkroom;
    } else if (product.name.toLowerCase().contains('pantalón') || 
               product.name.toLowerCase().contains('short')) {
      productIcon = Icons.dry_cleaning;
    }
    
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFD17B7B).withOpacity(0.9),
              Color(0xFFC76B6B).withOpacity(0.9),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFFF9A76),
                      Color(0xFFFF7B7B),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  productIcon,
                  size: 26,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 3),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        product.category,
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white70,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==================== SETTINGS PAGE (Formulario) ====================
class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  String selectedCategory = 'Polos';
  
  List<String> categories = [
    'Polos',
    'Camisetas',
    'Pantalones',
    'Zapatillas',
    'Balones',
    'Accesorios',
    'Raquetas',
    'Bicicletas',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Productos'),
        centerTitle: true,
        backgroundColor: Color(0xFF2D1B3D),
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF2D1B3D),
              Color(0xFF8B4F6F),
              Color(0xFFD17B7B),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  
                  // Icono decorativo
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFFF9A76),
                          Color(0xFFFF7B7B),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFFF7B7B).withOpacity(0.4),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.add_shopping_cart,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 30),
                  
                  Text(
                    'REGISTRO DE PRODUCTOS',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  
                  // Formulario
                  Container(
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFD17B7B).withOpacity(0.9),
                          Color(0xFFC76B6B).withOpacity(0.9),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 20,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Nombre del producto
                        TextField(
                          controller: _nameController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Nombre del producto',
                            labelStyle: TextStyle(color: Colors.white70),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white54),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 2),
                            ),
                            prefixIcon: Icon(Icons.inventory_2_outlined, color: Colors.white70),
                          ),
                        ),
                        SizedBox(height: 30),
                        
                        // Categoría
                        DropdownButtonFormField<String>(
                          value: selectedCategory,
                          dropdownColor: Color(0xFFC76B6B),
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Categoría',
                            labelStyle: TextStyle(color: Colors.white70),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white54),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 2),
                            ),
                            prefixIcon: Icon(Icons.category, color: Colors.white70),
                          ),
                          items: categories.map((String category) {
                            return DropdownMenuItem<String>(
                              value: category,
                              child: Text(category),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCategory = newValue!;
                            });
                          },
                        ),
                        SizedBox(height: 30),
                        
                        // Precio
                        TextField(
                          controller: _priceController,
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Precio',
                            labelStyle: TextStyle(color: Colors.white70),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white54),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 2),
                            ),
                            prefixIcon: Icon(Icons.attach_money, color: Colors.white70),
                          ),
                        ),
                        SizedBox(height: 50),
                        
                        // Botón Guardar
                        ElevatedButton(
                          onPressed: () {
                            if (_nameController.text.isNotEmpty &&
                                _priceController.text.isNotEmpty) {
                              // Agregar producto a la lista
                              productList.add(
                                Product(
                                  name: _nameController.text,
                                  price: double.tryParse(_priceController.text) ?? 0.0,
                                  category: selectedCategory,
                                ),
                              );
                              
                              // Mostrar mensaje
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('¡Producto agregado exitosamente!'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                              
                              // Limpiar campos
                              _nameController.clear();
                              _priceController.clear();
                              
                              // Volver al menú después de 1 segundo
                              Future.delayed(Duration(seconds: 1), () {
                                Navigator.pushReplacementNamed(context, "/menu");
                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Por favor completa todos los campos'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 5,
                          ),
                          child: Text(
                            'GUARDAR',
                            style: TextStyle(
                              color: Color(0xFFD17B7B),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }
}

// ==================== PRODUCT MODEL ====================
class Product {
  final String name;
  final double price;
  final String category;

  Product({
    required this.name,
    required this.price,
    required this.category,
  });
}