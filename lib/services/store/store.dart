import 'dart:convert';

import 'package:auth/entities/i_entity.dart';
import 'package:auth/services/store/i_config_store.dart';
import 'package:auth/services/store/i_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Store implements IStore, IConfigStore {
  late final SharedPreferences _preferences;

  @override
  Future<void> open() async {
    _preferences = await SharedPreferences.getInstance();
  }

  @override
  Future<bool> save<T extends IEntity>(
      int key, Map<String, dynamic> entity) async {
    final storeKey = "${T.toString()}_$key";
    return await _preferences.setString(storeKey, jsonEncode(entity));
  }

  @override
  Future<Map<String, dynamic>?> load<T extends IEntity>(int key) async {
    final storeKey = "${T.toString()}_$key";
    final value = _preferences.getString(storeKey);
    return value != null ? jsonDecode(value) : null;
  }
}
