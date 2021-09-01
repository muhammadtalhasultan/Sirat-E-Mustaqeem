class Juz {
  final int id;
  final String englishName;
  final String arabicName;

  Juz({
    required this.id,
    required this.englishName,
    required this.arabicName,
  });
}

class Juzs {
  final List<Juz> _juzs = [];

  void initializeData(List<Map<String, Object?>> datas) {
    for (final Map<String, Object?> data in datas) {
      _juzs.add(
        Juz(
          id: data['no'] as int,
          englishName: data['name_english'].toString(),
          arabicName: data['name_arabic'].toString(),
        ),
      );
    }
  }

  List<Juz> get juzs => _juzs;
}
