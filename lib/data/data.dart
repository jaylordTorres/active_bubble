import 'dart:math';

import 'package:faker/faker.dart';

dynamic createIdea(int id) => ({
      "id": id,
      "user": {
        "image": faker.image.image(width: 50, height: 50),
        "firstName": faker.person.firstName(),
        "surname": faker.person.lastName(),
        "middleName": faker.person.lastName(),
        // "full_name": faker.internet.userName(),
      },
      "content": faker.lorem.sentences(Random().nextInt(5) + 1).join("\n"),
    });

final ideas = List.generate(20, createIdea);
