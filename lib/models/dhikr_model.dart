class DhikrModel {
  final int count;
  final int goal;
  final int completedGoal;
  final String dhikrName;
  final String arabicText;
  final String translation;
  final bool isVoiceMode;

  const DhikrModel({
    this.count = 0,
    this.completedGoal = 24,
    this.goal = 33,
    this.dhikrName = 'SUBHANALLAH',
    this.arabicText = 'سُبْحَانَ ٱللَّٰه',
    this.translation = 'GLORY BE TO ALLAH',
    this.isVoiceMode = false,
  });

  DhikrModel copyWith({
    int? count,
    int? completedGoal,
    int? goal,
    String? dhikrName,
    String? arabicText,
    String? translation,
    bool? isVoiceMode,
  }) {
    return DhikrModel(
      count: count ?? this.count,
      completedGoal: completedGoal ?? this.completedGoal,
      goal: goal ?? this.goal,
      dhikrName: dhikrName ?? this.dhikrName,
      arabicText: arabicText ?? this.arabicText,
      translation: translation ?? this.translation,
      isVoiceMode: isVoiceMode ?? this.isVoiceMode,
    );
  }
}