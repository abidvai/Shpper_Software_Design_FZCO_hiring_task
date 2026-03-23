import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dhikr_provider.dart';

final sessionGoalProvider = Provider<double>((ref) {
  final state = ref.watch(dhikrProvider);
  if (state.goal == 0) return 0.0;
  return state.completedGoal / state.goal;
});