class Dua {
  final int id;
  final String surah;
  final int ayaNumber;
  final String aya;
  final int favorite;

  Dua({
    required this.id,
    required this.surah,
    required this.ayaNumber,
    required this.aya,
    required this.favorite,
  });
}

class Duas {
  final List<Dua> _duas = [];

  void initializeData(List<Map<String, Object?>> datas) {
    for (final Map<String, Object?> data in datas) {
      _duas.add(
        Dua(
          id: data['id'] as int,
          surah: data['surah'].toString(),
          ayaNumber: data['id'] as int,
          aya: data['aya'].toString(),
          favorite: data['favorite'] as int,
        ),
      );
    }
  }

  List<Dua> get duas => _duas;
}
