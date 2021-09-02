class Tasbih {
  final int id;
  final String name;
  final int counter;
  final int favorite;

  Tasbih({
    required this.id,
    required this.name,
    required this.counter,
    required this.favorite,
  });
}

class Tasbihs {
  final List<Tasbih> _tasbihs = [];

  void initializeData(List<Map<String, Object?>> datas) {
    for (final Map<String, Object?> data in datas) {
      _tasbihs.add(
        Tasbih(
          id: data['id'] as int,
          name: data['name'].toString(),
          counter: data['counter'] as int,
          favorite: data['favorite'] as int,
        ),
      );
    }
  }

  List<Tasbih> get tasbihs => _tasbihs;

  List<Tasbih> get getFavoritesTasbih =>
      _tasbihs.where((Tasbih tasbih) => tasbih.favorite == 1).toList();
}
