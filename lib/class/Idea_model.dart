class IdeaModel {
  final String content;
  final String fullName;
  final String userThumb;
  final int id;
  IdeaModel.fromJson(item)
      : id = item['id'],
        content = item["content"],
        userThumb = item["user_thumb"],
        fullName = item["full_name"];
}
