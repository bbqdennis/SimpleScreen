import 'package:flutter/material.dart';

// 顶级函数，用于读取 DataPool 中的值
dynamic dataPoolSimpleReadData(String key) {
  return DataPool.read(key);
}

dynamic dataPoolSimpleWriteData(String key, dynamic value) {
  return DataPool.setData(key, value);
}

dynamic dataPoolSimpleChangeData(String key) {
  return DataPool.getValueNotifier(key);
}

class DataPool {
  static final dataPoolDictionary = <String, dynamic>{};

  static ValueNotifier<dynamic> _createData(String key, dynamic value) {
    dataPoolDictionary[key] = ValueNotifier<dynamic>(value);
    return dataPoolDictionary[key]!;
  }

  static ValueNotifier<dynamic> setData(String key, dynamic value) {
    if (!dataPoolDictionary.containsKey(key)) {
      return _createData(key, value);
    } else {
      ValueNotifier<dynamic> data = dataPoolDictionary[key]!;
      data.value = value;

      return data;
    }
  }

  static ValueNotifier<dynamic> _getData(String key) {
    if (dataPoolDictionary.containsKey(key)) {
      return dataPoolDictionary[key]!;
    } else {
      return ValueNotifier<dynamic>(null);
    }
  }

  static dynamic read(String key) {
    return _getData(key).value;
  }

  static int getIntData(String key) {
    final data = _getData(key);

    if (data.value is int) {
      return data.value as int;
    } else if (data.value is String) {
      return int.tryParse(data.value) ?? 0;
    } else {
      return 0;
    }
  }

  static String getStringData(String key) {
    final data = _getData(key);

    if (data.value is String) {
      return data.value as String;
    } else if (data.value is int) {
      return data.value.toString();
    } else {
      return '';
    }
  }

  static ValueNotifier<dynamic> getValueNotifier(String key) {
    if (!dataPoolDictionary.containsKey(key)) {
      return ValueNotifier<dynamic>(null);
    }
    return dataPoolDictionary[key]!;
  }
}
