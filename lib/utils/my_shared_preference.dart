import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../barrel/models.dart';
import '../barrel/utils.dart';
import '../localization/localization_constants.dart';

class MySharedPreference {

  Future<SharedPreferences>? _prefs;

  static const String languageCode = "y476rh";
  static const String targetUrl = "r9nut945u5";
  static const String currentUser = "b7688989";
  static const String companyCode = "esiunycyrt";

  MySharedPreference() {
    _prefs = SharedPreferences.getInstance();
  }

  Future<Locale> saveLanguageCode(String languageCode) async {

    final SharedPreferences prefs = await _prefs!;
    await prefs.setString(languageCode, languageCode);

    return getLocale(languageCode);
  }

  Future<Locale> getLanguageCode() async {

    final SharedPreferences prefs = await _prefs!;
    String code = prefs.getString(languageCode) ?? english;

    return getLocale(code);
  }

  Future<void> saveCompanyCode(String code) async {

    final SharedPreferences? prefs = await _prefs;
    await prefs?.setString(companyCode, code);
  }


  Future<String> getCompanyCode() async {

    final SharedPreferences? prefs = await _prefs;
    String code = prefs?.getString(companyCode) ?? "";

    return code;
  }

  Future<void> saveTargetUrl(String url) async {

    final SharedPreferences? prefs = await _prefs;
    await prefs?.setString(targetUrl, url);
  }

  Future<String> getTargetUrl() async {

    final SharedPreferences? prefs = await _prefs;
    String url = prefs?.getString(targetUrl) ?? "";

    return url;
  }

  Future<void> setUser(User user) async {

    final SharedPreferences prefs = await _prefs!;
    await prefs.setString(currentUser, json.encode(user.toJson()));
  }

  Future<User?> getUser() async {

    final SharedPreferences prefs = await _prefs!;

    if(prefs.containsKey(currentUser)) {
      var data = json.decode(prefs.get(currentUser) as String);
      User user = User.fromJson(data);
      return user;
    }

    return null;
  }

  Future<Set<String>> getAllKeys() async {

    final SharedPreferences prefs = await _prefs!;
    return prefs.getKeys();
  }

  Future<bool> clearAllData() async {

    final SharedPreferences prefs = await _prefs!;
    return prefs.clear();
  }

  Future remove(String key) async {

    final SharedPreferences prefs = await _prefs!;

    if(prefs.containsKey(key)) {
      await prefs.remove(key);
    }
  }
}