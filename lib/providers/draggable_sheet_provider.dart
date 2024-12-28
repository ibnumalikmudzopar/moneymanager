import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateNotifier untuk mengelola status apakah sheet diperluas atau tidak
class DraggableSheetNotifier extends StateNotifier<bool> {
  DraggableSheetNotifier() : super(false); // false berarti tidak diperluas (collapsed)

  void toggle() {
    state = !state; // Toggle antara true dan false
  }
}

// Provider untuk mengakses state di widget
final draggableSheetProvider =
    StateNotifierProvider<DraggableSheetNotifier, bool>((ref) {
  return DraggableSheetNotifier();
});
