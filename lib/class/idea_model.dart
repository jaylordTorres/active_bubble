import 'package:active_bubble/class/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'base_model.dart';

class IdeaModel implements BaseModel {
  IdeaModel.dummy({this.content, this.userThumb, this.user, this.id});
  IdeaModel.fromJson(data)
      : id = data['id'],
        content = data["content"],
        userThumb = data["user_thumb"],
        user = User.fromJson(data["user"]);
  static Future<IdeaModel> fromQuerySnopShotAsync(
      QueryDocumentSnapshot snop) async {
    final data = snop.data();
    final user = data["cb"] != null
        ? await User.fromDocumentReferenceAsync(data["cb"])
        : null;
    return IdeaModel.dummy(
      id: data["id"],
      content: data["c"],
      user: user,
    );
  }

  String content;
  String userThumb;
  User user;
  int id;
}
