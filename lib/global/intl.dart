import 'package:SButler/global/public.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//语言的国际化配置
class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static final fallbackLocale = Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
        'zh_CN': zh_CN,
      };
}

class StrRes {
  static get login => 'login'.tr;
}
