

import 'android/tyhdemo/bean/address_bean_entity.dart';
import 'android/yk/passByValue/Entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "AddressBeanEntity") {
      return AddressBeanEntity.fromJson(json) as T;
    } else if (T.toString() == "Entity") {
      return Entity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}