import 'dart:convert';
import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';

/// A class that manages the Hive database.
class HiveManager {
  static String boxName = "data";

  /// Initializes the Hive database.
  ///
  /// This function initializes the Hive database and opens a box with the given [boxName].
  /// It should be called before performing any operations on the database.
  ///
  /// Example:
  /// ```dart
  /// await HiveManager.initHive();
  /// ```
  static Future<void> initHive() async {
// Directory dir = await getApplicationDocumentsDirectory();
    // var path = Directory.current.path;
    await Hive.initFlutter();
    await Hive.openBox(boxName);
  }

  /// Retrieves the Hive box.
  ///
  /// This function returns the Hive box with the given [boxName].
  ///
  /// Example:
  /// ```dart
  /// Box<dynamic> box = HiveManager.getBox();
  /// ```
  static Box<dynamic> getBox() {
    return Hive.box(boxName);
  }

  /// Adds data to the Hive database.
  ///
  /// This function adds the given [value] to the Hive database with the specified [key].
  ///
  /// Example:
  /// ```dart
  /// HiveManager.addData("name", "John Doe");
  /// ```
  static void addData(String key, dynamic value) {
    getBox().put(key, jsonEncode(value));
  }

  /// Retrieves data from the Hive database.
  ///
  /// This function retrieves the data from the Hive database with the specified [key].
  /// If the data exists, it is returned as a dynamic object.
  /// If the data does not exist, null is returned.
  ///
  /// Example:
  /// ```dart
  /// dynamic data = HiveManager.getData("name");
  /// ```
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

  /// Removes data from the Hive database.
  ///
  /// This function removes the data from the Hive database with the specified [key].
  ///
  /// Example:
  /// ```dart
  /// HiveManager.remove("name");
  /// ```
  static void remove(String key) {
    getBox().delete(key);
  }
}
