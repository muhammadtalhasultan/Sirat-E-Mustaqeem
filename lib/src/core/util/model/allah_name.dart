class AllahName {
  final String arabic;
  final String english;
  final String urduMeaning;
  final String englishMeaning;
  final String englishExplanation;

  AllahName({
    required this.arabic,
    required this.english,
    required this.urduMeaning,
    required this.englishMeaning,
    required this.englishExplanation,
  });
}

class AllahNames {
  final List<AllahName> _allahNames = [];

  void initializeData(List<Map<String, Object?>> names) {
    for (final Map<String, Object?> name in names) {
      _allahNames.add(
        AllahName(
          arabic: name['arabic'].toString(),
          english: name['english'].toString(),
          urduMeaning: name['urduMeaning'].toString(),
          englishMeaning: name['englishMeaning'].toString(),
          englishExplanation: name['englishExplanation'].toString(),
        ),
      );
    }
  }

  List<AllahName> get allahNames => _allahNames;
}
