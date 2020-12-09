import 'package:faker/faker.dart';

import 'base_model.dart';

class User implements BaseModel {
  User.dummy({this.firstName, this.image, this.surname, this.middleName});
  User.fromJson(data)
      : firstName = data["firstName"],
        surname = data["surname"],
        image = data["image"],
        middleName = data["middleName"];

  final firstName;
  final image;
  final surname;
  final middleName;

  String get fullName => "$firstName $middleName $surname";
}
