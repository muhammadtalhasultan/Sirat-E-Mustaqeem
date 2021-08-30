class Surah {
  final int id;
  final String nameEn;
  final String nameAr;
  final int ayats;
  final String place;

  Surah({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.ayats,
    required this.place,
  });
}

class Surahs {
  final List<Surah> _surahs = [];

  void initializeData(List<Map<String, Object?>> datas) {
    for (final Map<String, Object?> data in datas) {
      _surahs.add(
        Surah(
          id: data['id'] as int,
          nameEn: data['name_en'].toString(),
          nameAr: data['name_ar'].toString(),
          ayats: data['ayats'] as int,
          place: data['place'].toString(),
        ),
      );
    }
  }

  List<Surah> get surahs => _surahs;
}
