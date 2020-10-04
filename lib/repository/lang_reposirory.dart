import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';


class LanguageRepository {
  static final String LANGUAGE = 'Language';





  static Future<void> saveLang(String  lang) async {
    /// write to keystore/keychain
    final storage = new FlutterSecureStorage();
//    await storage.write(key:USER , value: empCode);
    return await storage.write(key: LANGUAGE, value: lang);
  }

  static Future<String> hasLang() async {
    /// read from keystore/keychain
    final storage = new FlutterSecureStorage();
    return await storage.read(key: LANGUAGE);
  }
}
