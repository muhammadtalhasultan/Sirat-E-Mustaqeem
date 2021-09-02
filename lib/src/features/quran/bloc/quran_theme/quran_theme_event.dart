part of 'quran_theme_bloc.dart';

abstract class QuranThemeEvent extends Equatable {
  const QuranThemeEvent();
}

class ShowTranslation extends QuranThemeEvent {
  final bool show;

  ShowTranslation(this.show);

  @override
  List<Object> get props => [show];
}

class SwitchTranslationMode extends QuranThemeEvent {
  final String mode;

  SwitchTranslationMode(this.mode);

  @override
  List<Object> get props => [mode];
}

class ShowWithArab extends QuranThemeEvent {
  final bool show;

  ShowWithArab(this.show);

  @override
  List<Object> get props => [show];
}

class AddQuranFontSize extends QuranThemeEvent {
  AddQuranFontSize();

  @override
  List<Object> get props => [];
}

class ReduceQuranFontSize extends QuranThemeEvent {
  ReduceQuranFontSize();

  @override
  List<Object> get props => [];
}

class SetQuranFontFamily extends QuranThemeEvent {
  final String family;

  SetQuranFontFamily(this.family);

  @override
  List<Object> get props => [family];
}

class AddTranslationFontSize extends QuranThemeEvent {
  AddTranslationFontSize();

  @override
  List<Object> get props => [];
}

class ReduceTranslationFontSize extends QuranThemeEvent {
  ReduceTranslationFontSize();

  @override
  List<Object> get props => [];
}

class SetTranslationFontFamily extends QuranThemeEvent {
  final String family;

  SetTranslationFontFamily(this.family);

  @override
  List<Object> get props => [family];
}
