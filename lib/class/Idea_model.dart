import 'package:active_bubble/class/user_model.dart';

import 'base_model.dart';

class IdeaModel implements BaseModel {
  IdeaModel.dummy(
      {this.content, this.fullName, this.userThumb, this.user, this.id});
  IdeaModel.fromJson(data)
      : id = data['id'],
        content = data["content"],
        userThumb = data["user_thumb"],
        user = User.fromJson(data["user"]),
        fullName = data["full_name"];

  final String content;
  final String fullName;
  final String userThumb;
  final User user;
  final int id;
}
