import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateProvider untuk mengelola state counter
final counterProvider = StateProvider<int>((ref) => 0); // ref (membaca/memperbarui)