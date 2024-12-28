
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../providers/counter_provider.dart';

class Home extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Mengambil nilai counter dari StateProvider
    final count = ref.watch(counterProvider); // ref.watch (mengambil)

    return Scaffold(
      appBar: AppBar(title: Text('Counter with Riverpod')),
      body: Center(
        child: Text('Count: $count', style: TextStyle(fontSize: 24)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Menggunakan ref.read untuk memperbarui nilai counter
          ref.read(counterProvider.notifier).state++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}