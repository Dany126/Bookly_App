import 'package:hive_flutter/hive_flutter.dart';

class CacheService {
  static const String booksBox = 'books_box';

  static Future<void> init() async {
    await Hive.initFlutter();

    await Hive.openBox(booksBox);
  }

  static Future<void> saveData({
    required String key,
    required dynamic value,
  }) async {
    final box = Hive.box(booksBox);

    await box.put(key, value);
  }

  static dynamic getData({required String key}) {
    final box = Hive.box(booksBox);

    return box.get(key);
  }

  static Future<void> clearData({required String key}) async {
    final box = Hive.box(booksBox);

    await box.delete(key);
  }
}
