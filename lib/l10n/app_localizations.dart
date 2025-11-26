import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// Abstract class
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = locale;
  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get getStartedButton;
  String get chooseLanguage;
  String get continueButton;

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    _AppLocalizationsDelegate(),
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  static const List<Locale> supportedLocales = [
    Locale('en'),
    Locale('ne'),
  ];
}

class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn() : super('en');

  @override
  String get getStartedButton => 'Get Started';
  @override
  String get chooseLanguage => 'Choose your preferred language and continue';
  @override
  String get continueButton => 'Continue';
}

class AppLocalizationsNe extends AppLocalizations {
  AppLocalizationsNe() : super('ne');

  @override
  String get getStartedButton => 'सुरु गर्नुहोस्';
  @override
  String get chooseLanguage => 'आफ्नो मनपर्ने भाषा चयन गर्नुहोस् र जारी राख्नुहोस्';
  @override
  String get continueButton => 'जारी राख्नुहोस्';
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ne'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    switch (locale.languageCode) {
      case 'ne':
        return AppLocalizationsNe();
      case 'en':
      default:
        return AppLocalizationsEn();
    }
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) => false;
}

