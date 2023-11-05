import 'dart:convert';
import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';

class HiveManager {
  static String boxName = "data";

  static Future<void> initHive() async {
    // Directory dir = await getApplicationDocumentsDirectory();
    // var path = Directory.current.path;
    await Hive.initFlutter();
    await Hive.openBox(boxName);
  }

  static Box<dynamic> getBox() {
    return Hive.box(boxName);
  }

  static void addData(String key, dynamic value) {
    getBox().put(key, jsonEncode(value));
  }

  static dynamic getData(String key) {
    try {
      final box = getBox();
      var data = box.get(key);
      if (data != null) {
        return jsonDecode(data);
      }
      return null;
    } catch (e) {
      print(e);
    }
  }

  static void remove(String key) {
    getBox().delete(key);
  }
}
