class User {
  String? userEmail, userNiceName, userDisplayNme, token;

  User({this.userEmail, this.userNiceName, this.userDisplayNme, this.token});

  User.fromJson(Map<String, dynamic> json) {
    userEmail  = json['user_email'] ?? '';
    userNiceName = json['user_nicename'] ?? '';
    userDisplayNme = json['user_display_name'] ?? '';
    token = json['token'] ?? '';
  }

  toJson() {
    return{
      'user_email': userEmail,
      'user_nicename': userNiceName,
      'user_display_name': userDisplayNme,
      'token': token
    };
  }
}