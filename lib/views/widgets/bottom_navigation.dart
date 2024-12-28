import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../home_screen.dart';
import '../insight_screen.dart';
import '../wallet_screen.dart';
import '../more_screen.dart';

// Provider untuk menyimpan index yang dipilih
final selectedIndexProvider = StateProvider<int>((ref) => 0);

class BottomNavigation extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _selectedIndex = ref.watch(selectedIndexProvider);

    // Daftar widget yang akan ditampilkan sesuai index
    final List<Widget> _widgetOptions = <Widget>[
      HomeScreen(),
      InsightScreen(),
      WalletScreen(),
      MoreScreen(),
    ];

    void _onItemTapped(int index) {
      ref.read(selectedIndexProvider.notifier).state = index;
    }

    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insights),
            label: 'Insight',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more),
            label: 'More',
          ),
        ],
        backgroundColor: Colors.black54,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.yellow,
        onTap: _onItemTapped,
      ),
    );
  }
}
