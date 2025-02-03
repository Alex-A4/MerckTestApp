import 'dart:ui';

enum SupportedLocaleCodes {
  en;

  Locale get locale => Locale(name);

  static SupportedLocaleCodes byName(String name) {
    for (final value in SupportedLocaleCodes.values) {
      if (value.name == name) return value;
    }

    return fallbackLocaleCode;
  }
}

const fallbackLocaleCode = SupportedLocaleCodes.en;

final supportedLocales = SupportedLocaleCodes.values
    .map(
      (locale) => locale.locale,
    )
    .toList();
final fallbackLocale = Locale(fallbackLocaleCode.name);
