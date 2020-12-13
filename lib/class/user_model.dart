import 'dart:convert';

import 'package:active_bubble/class/store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base_model.dart';

class User implements BaseModel {
  static String collection = 'user';
  static Map<String, User> store = {};

  static SharedPreferences getCacheStore() {
    return Store.storage;
  }

  static String path(String id) {
    return "$collection/$id";
  }

  /// update cache store and local store
  static update(String _id, User user) async {
    store[_id] = user;
    print('called save' + _id);
    await getCacheStore().setString(path(_id), user.toString());
  }

  User.dummy(
      {this.id, this.firstName, this.image, this.surname, this.middleName});
  User.fromJson(data)
      : firstName = data["firstName"],
        id = data["id"],
        surname = data["surname"],
        image = data["image"],
        middleName = data["middleName"];

  User.fromQuerySnopShot(DocumentSnapshot snop) {
    // final data = snop.data();
    firstName = snop["fn"];
    surname = snop["ln"];
    middleName = snop["mn"];
    image = snop["p"];
  }
  static User fromString(String value) {
    return User.fromJson(json.decode(value));
  }

  //// check item if exist on cache if not check on storage if not then fetch
  static Future<User> fromDocumentReferenceAsync(DocumentReference ref) async {
    final _id = ref.id;
    if (store?.containsKey(_id) == true) return store[_id];
    final stringValue = await Store.storage.get(path(_id));
    if (stringValue != null) {
      final User u = fromString(stringValue);
      store[_id] = u;
      return u;
    }

    // fetch data then save to cache at storage
    final data = await ref.get();
    final user = User.fromQuerySnopShot(data);
    // cache data to store
    update(ref.id, user);

    return user;
  }

  toJson() {
    return {
      "id": id,
      "firstName": firstName,
      "surname": surname,
      "image": image,
      "middleName": middleName
    };
  }

  @override
  toString() {
    return json.encode(this.toJson());
  }

  String firstName;
  String image;
  String surname;
  String middleName;
  String id;

  String get fullName => "$firstName $surname";
}
