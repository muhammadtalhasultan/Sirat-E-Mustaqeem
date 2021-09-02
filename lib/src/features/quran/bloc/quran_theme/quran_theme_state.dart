part of 'quran_theme_bloc.dart';

class QuranThemeState extends Equatable {
  final bool showTranslation;
  final String translationMode;
  final bool withArabs;
  final double quranFontSize;
  final double translationFontSize;
  final String quranFontFamily;
  final String translationFontFamily;

  QuranThemeState({
    required this.showTranslation,
    required this.translationMode,
    required this.withArabs,
    required this.quranFontSize,
    required this.translationFontSize,
    required this.quranFontFamily,
    required this.translationFontFamily,
  });

  @override
  List<Object> get props => [
        showTranslation,
        translationMode,
        withArabs,
        quranFontSize,
        translationFontSize,
        quranFontFamily,
        translationFontFamily,
      ];
}
