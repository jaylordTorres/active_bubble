class CommonResponseModel {
  dynamic data;
  String status;
  int totalResults;
  CommonResponseModel.fromJson(Map<String, dynamic> json) {
    totalResults = json['totalResults'];
    status = json["status"];
    data = json;
  }
}
