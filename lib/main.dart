import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cell_ussd/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.green, // navigation bar color
      statusBarColor: Colors.green, // status bar color
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const CellUssdApp());
}

class CellUssdApp extends StatelessWidget {
  const CellUssdApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cell USSD App UI design',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 1;

  final List<Widget> _pages = <Widget>[
    const Scaffold(
      body: Center(child: Text('Toll free number')),
    ),
    const HomeScreen(),
    const Scaffold(
      body: Center(child: Text('Customer Service')),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Numéro vert",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Accueil",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: "Service client",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black.withOpacity(0.60),
        onTap: _onItemTapped,
      ),
    );
  }
}
