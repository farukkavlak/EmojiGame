import 'dart:async' show Future;
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {
  static PreferenceUtils? _instance;
  SharedPreferences? _preferences;

  PreferenceUtils._();

  static Future<void> initSharedPreferences() async {
    if (PreferenceUtils.instance._preferences != null) return;
    PreferenceUtils.instance._preferences = await SharedPreferences.getInstance();
  }

  static PreferenceUtils get instance {
    if (_instance != null) {
      return _instance!;
    }
    _instance = PreferenceUtils._();
    return _instance!;
  }

  Future<bool>? setHP(int value) async {
    return await _preferences?.setInt("HP", value) ?? false;
  }

  int getHP() {
    if(_preferences?.getInt("HP")==null){
      () async {
        await _preferences?.setInt("HP", 5);
      };
    }
    return _preferences?.getInt("HP") ?? 5;
  }
  Future<bool> setHint(int value) async {
    return await _preferences!.setInt('Hint', value);
  }
  int getHint() {
    if(_preferences?.getInt("Hint")==null){
      () async {
        await _preferences?.setInt("Hint", 5);
      };
    }
    return _preferences?.getInt("Hint") ?? 5;
  }
  Future<bool> setLevel(String levelNo,bool check) async {
    //print("set");
    //print(levelNo);
    return await _preferences!.setBool(levelNo, check);
  }
  bool getLevel(String key) {
    //print("get");
    //print(key);
    if(_preferences?.getBool(key)==null){
      () async {
        await _preferences?.setBool(key, false);
      };
    }
    return _preferences?.getBool(key) ?? false;
  }
}