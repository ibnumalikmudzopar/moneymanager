import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/home_provider.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Menyimpan tab index yang sedang aktif
    final currentTabIndex = ref.watch(currentTabIndexProvider);


    return Scaffold(
      body: IndexedStack(
        index: currentTabIndex,
        children: <Widget>[
          // Halaman yang akan ditampilkan pada setiap tab
          Center(child: Text('Home Screen')),
          Center(child: Text('Advanced Screen')),
          Center(child: Text('In Action Screen')),
          Center(child: Text('Bookmarks Screen')),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTabIndex,
        type: BottomNavigationBarType.shifting,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Basics',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart),
            label: 'Advanced',
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rocket),
            label: 'In Action',
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Bookmarks',
            backgroundColor: Colors.indigo,
          ),
        ],
        onTap: (index) {
          // Mengubah tab index sesuai dengan tab yang dipilih
          ref.read(currentTabIndexProvider.notifier).state = index;
        },
      ),
    );
  }
}