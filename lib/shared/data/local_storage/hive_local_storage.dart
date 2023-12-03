import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart' as hf;
import 'package:podipu/shared/consts/hive_key.dart';

class HiveLocalStorage {
  static Future<void> init() async {
    await hf.Hive.initFlutter();

    await openBoxes();
  }

  static Future<void> openBoxes() async {
    //open all boxes
    await Hive.openBox<String>(HiveKey.cacheBoxKey);
    await Hive.openBox<String>(HiveKey.recentPlayedBoxKey);
    await Hive.openBox<String>(HiveKey.savedEpisodeBoxKey);
  }

  static Future<dynamic> get({
    required String boxName,
    String? key,
  }) async {
    final box = Hive.box<String>(boxName);

    try {
      if (!box.isOpen) {
        await openBoxes();
      }

      if (key != null) {
        return box.get(key);
      }

      return box.values.toList();
    } catch (e) {
      throw Exception('Box closed');
    }
  }

  static Future<void> set({
    required String boxName,
    required String key,
    required dynamic value,
  }) async {
    final box = Hive.box<String>(boxName);
    try {
      if (!box.isOpen) {
        await openBoxes();
      }

      await box.put(key, value);
    } catch (e) {
      throw Exception('Box closed');
    }
  }

  static Future<void> remove({
    required String boxName,
    required String key,
  }) async {
    final box = Hive.box<String>(boxName);
    try {
      if (!box.isOpen) {
        await openBoxes();
      }

      await box.delete(key);
    } catch (e) {
      throw Exception('Box closed');
    }
  }
}
