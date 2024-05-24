import 'package:hive_flutter/hive_flutter.dart';

import '../../constant/strings.dart';

class NotifyLocalService {
  late final Box<int> _box;

  Future openBox() async =>
      _box = await Hive.openBox<int>(LocalKey.kMarkReadNotify);

  bool get _isOpen => Hive.isBoxOpen(LocalKey.kMarkReadNotify);

  Future<List<int>> getMarkReads() async {
    if (!_isOpen) await openBox();

    final List<int> data = _box.values.toList();
    return data;
  }

  Future<bool> markRead(int id) async {
    if (!_isOpen) await openBox();
    await _box.add(id);
    return true;
  }

  Future<bool> clearData() async {
    if (!_isOpen) await openBox();

    try {
      final length = await _box.clear();
      return length == 0;
    } catch (e) {
      return false;
    }
  }
}
