import 'package:dhikr_hiring_task/models/dhikr_model.dart';
import 'package:flutter_riverpod/legacy.dart';

final dhikrProvider = StateNotifierProvider<DhikrNotifier, DhikrModel>(
  (ref) => DhikrNotifier(),
);

class DhikrNotifier extends StateNotifier<DhikrModel> {
  DhikrNotifier() : super(const DhikrModel());

  void increment() {
    state = state.copyWith(count: state.count + 1);
  }

  void reset() {
    state = state.copyWith(count: 0);
  }

  void toggleVoiceMode() {
    state = state.copyWith(isVoiceMode: !state.isVoiceMode);
  }
}
