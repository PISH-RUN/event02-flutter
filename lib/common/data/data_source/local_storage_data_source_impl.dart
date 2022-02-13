import 'package:flutter/cupertino.dart';

import 'local_storage_data_source.dart';

class LocalStorageDataSourceImpl implements LocalStorageDataSource {
  Function(String) read;
  Function(String, String) write;
  Function getMillisecondsSinceEpoch;

  LocalStorageDataSourceImpl({@required this.read, @required this.write, @required this.getMillisecondsSinceEpoch});

  @override
  String getStringWithKey(String key) {
    final expireDate = read("$key expireDate") ?? "";
    try {
      if (int.parse(expireDate) < getMillisecondsSinceEpoch()) setStringWithKey(key, "");
    } finally {
      return read(key) ?? "";
    }
  }

  @override
  void setStringWithKey(String key, String value, {Duration duration = null}) {
    write(key, value);
    int currentTime = getMillisecondsSinceEpoch();
    if (duration != null) write("$key expireDate", (currentTime + duration.inMilliseconds).toString());
  }
}
