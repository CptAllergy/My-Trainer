import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class LocalizationService {
  late final Locale locale;
  late Map<String, dynamic> _localizedString;

  LocalizationService(this.locale);

  static LocalizationService of(BuildContext context) {
    return Localizations.of(context, LocalizationService);
  }

  static const supportedLocales = [Locale("en"), Locale("pt")];

  static const _delegate = _LocalizationsDelegate();

  static const localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    _delegate
  ];

  Future<void> load() async {
    final jsonString =
        await rootBundle.loadString('assets/i18n/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    _localizedString = jsonMap.map((key, value) => MapEntry(key, value));
  }

  static Locale? localeResolutionCallback(
      Locale? locale, Iterable<Locale>? supportedLocales) {
    if (supportedLocales != null && locale != null) {
      return supportedLocales.firstWhere(
              (element) => element.languageCode == locale.languageCode,
          orElse: () => supportedLocales.first);
    }
    return null;
  }


  /// key - sequence of keys must be separated by '.'
  String translate(String key) {
    String? translation = findTranslation(key,_localizedString);
    return translation ?? key;
  }

  String? findTranslation(String key, dynamic map) {
    // Split key by first divider if it exists
    int idx = key.indexOf(".");
    List keys = idx != -1 ? [key.substring(0,idx), key.substring(idx+1)] : [key, ""];

    var value = map[keys[0]];
    if(value == null) {
      return null;
    } else if(value is String) {
      return value;
    } else {
      return findTranslation(keys[1], value);
    }
  }

}

class _LocalizationsDelegate
    extends LocalizationsDelegate<LocalizationService> {
  const _LocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    var languages = LocalizationService.supportedLocales.map((element) => element.languageCode);
    return languages.contains(locale.languageCode);
  }

  @override
  Future<LocalizationService> load(Locale locale) async {
    LocalizationService service = LocalizationService(locale);
    await service.load();
    return service;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<LocalizationService> old) {
    return false;
  }
}
