import 'dart:math';

import 'package:faker/faker.dart';

dynamic createIdea(int id) => ({
      "id": id,
      "full_name": faker.internet.userName(),
      "content": faker.lorem.sentences(Random().nextInt(5) + 1).join("\n"),
      "user_thumb": faker.image.image(width: 50, height: 50)
    });

final ideas = List.generate(20, createIdea);
