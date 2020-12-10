import 'package:cloud_firestore/cloud_firestore.dart';

import 'base_model.dart';

class User implements BaseModel {
  User.dummy({this.firstName, this.image, this.surname, this.middleName});
  User.fromJson(data)
      : firstName = data["firstName"],
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
  static Future<User> fromDocumentReferenceAsync(DocumentReference ref) async {
    final data = await ref.get();
    return User.fromQuerySnopShot(data);
  }

  String firstName;
  String image;
  String surname;
  String middleName;

  String get fullName => "$firstName $middleName $surname";
}
