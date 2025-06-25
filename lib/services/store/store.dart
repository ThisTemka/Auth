import 'dart:convert';

import 'package:auth/entities/i_entity.dart';
import 'package:auth/services/store/i_config_store.dart';
import 'package:auth/services/store/i_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Store implements IStore, IConfigStore {
  final Ref ref;
  late SharedPreferences sharedPreferences;

  Store(this.ref);

  @override
  Future<void> open() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Future<void> save<T extends IEntity>(
      int key, Map<String, dynamic> entity) async {
    final storeKey = "${T.toString()}_$key";
    await sharedPreferences.setString(storeKey, jsonEncode(entity));
  }

  @override
  Future<Map<String, dynamic>?> load<T extends IEntity>(int key) async {
    final storeKey = "${T.toString()}_$key";
    final value = sharedPreferences.getString(storeKey);
    return value != null ? jsonDecode(value) : null;
  }
}
