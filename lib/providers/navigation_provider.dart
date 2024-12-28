import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider untuk index BottomNavigationBar
final bottomNavIndexProvider = StateProvider<int>((ref) => 0);
// Provider untuk menyimpan index yang dipilih
final selectedIndexProvider = StateProvider<int>((ref) => 0);
 // Provider untuk index BottomNavigationBar
// final bottomNavIndexProvider = StateProvider<int>((ref) => 0);
