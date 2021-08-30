import '../../../../routes/routes.dart';

class Collection {
  final String assetName;
  final String title;
  final String routeName;

  Collection(this.assetName, this.title, this.routeName);
}

List<Collection> collections = [
  Collection(
    'assets/images/collection_icon/svg/quran.svg',
    'Quran',
    '',
  ),
  Collection(
    'assets/images/collection_icon/svg/hadees.svg',
    'Hadees',
    '',
  ),
  Collection(
    'assets/images/collection_icon/svg/duas.svg',
    'Doas',
    '',
  ),
  Collection(
    'assets/images/collection_icon/svg/tasbih.svg',
    'Tasbih',
    '',
  ),
  Collection(
    'assets/images/collection_icon/svg/quran.svg',
    '99 Names of Allah',
    RouteGenerator.allahName,
  ),
  Collection(
    'assets/images/collection_icon/svg/prayer_time.svg',
    'Prayer Times',
    RouteGenerator.prayerTimingPage,
  ),
  Collection(
    'assets/images/collection_icon/svg/kiblat.svg',
    'Qabah Direction',
    RouteGenerator.qibla,
  ),
  Collection(
    'assets/images/collection_icon/svg/other.svg',
    'Others',
    '',
  ),
];
