import 'package:get_storage/get_storage.dart';

class StorageHelper {
  static final StorageHelper instance = StorageHelper._internal();
  StorageHelper._internal();
  static final GetStorage _box = GetStorage();

  static bool get isLogin => _box.read('isLogin') ?? false;
  static set isLogin(bool value) => _box.write('isLogin', value);

  static bool get isAmountAdded => _box.read('isAmountAdded') ?? false;
  static set isAmountAdded(bool value) => _box.write('isAmountAdded', value);
}
