import 'package:flutter/material.dart';

extension LocaleNameExt on Locale {
  String get name => switch (languageCode) {
        'en' => 'English',
        'ru' => 'Русский',
        'uk' => 'Українська',
        _ => languageCode,
      };
}