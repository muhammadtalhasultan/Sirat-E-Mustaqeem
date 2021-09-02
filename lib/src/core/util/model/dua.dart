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
  final Map<String, List<Dua>> _categorizedDuas = <String, List<Dua>>{};

  void initializeData(List<Map<String, Object?>> datas) {
    for (final Map<String, Object?> data in datas) {
      _duas.add(
        Dua(
          id: data['id'] as int,
          surah: data['surah'].toString(),
          ayaNumber: data['aya_number'] as int,
          aya: data['aya'].toString(),
          favorite: data['favorite'] as int,
        ),
      );
    }

    final List<String> surahs =
        _duas.map((dua) => dua.surah).toList().toSet().toList();

    for (final surah in surahs) {
      final List<Dua> filteredDua = [];

      for (final dua in _duas) {
        if (dua.surah == surah) {
          filteredDua.add(dua);
        }
      }

      _categorizedDuas[surah] = filteredDua;
    }
  }

  List<Dua> get duas => _duas;
  Map<String, List<Dua>> get categorizedDuas => _categorizedDuas;
  List<MapEntry<String, List<Dua>>> get categorizedDuasList =>
      _categorizedDuas.entries.toList();

  List<Dua> get getFavoritesDua =>
      _duas.where((Dua dua) => dua.favorite == 1).toList();
}
