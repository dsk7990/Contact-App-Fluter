class SignInResponse {
  String success;
  String message;
  Data data;

  SignInResponse({this.success, this.message, this.data});

  SignInResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String userId;
  String userName;
  String userMobile;
  String userCity;

  Data({this.userId, this.userName, this.userMobile, this.userCity});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    userMobile = json['user_mobile'];
    userCity = json['user_city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['user_mobile'] = this.userMobile;
    data['user_city'] = this.userCity;
    return data;
  }
}
