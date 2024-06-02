import '../barrel/models.dart';

class User {
  int? id;
  String? name;
  String? username;
  int? employeeIdFk;
  String? email;
  int? twoFactorSecret;
  int? groupIdFk;
  int? projectIdFk;
  int? companyIdFk;
  int? projectTypeIdIk;
  int? status;
  int? branchId;
  int? roleId;
  String? roleName;
  String? softwareDate;
  String? accessToken;
  String? tokenType;
  String? twoFactorRecoveryCodes;
  String? suppCode;
  String? createdAt;
  String? updatedAt;

  User({this.id, this.name, this.username, this.employeeIdFk, this.email, this.twoFactorSecret, this.groupIdFk, this.softwareDate,
    this.projectIdFk, this.projectTypeIdIk, this.companyIdFk, this.branchId, this.roleId, this.roleName, this.accessToken, this.tokenType,
    this.status, this.twoFactorRecoveryCodes, this.suppCode, this.createdAt, this.updatedAt,});

  User.fromJson(Map<String, dynamic> json) {

    id = json['id'] == null ? 0 : int.parse(json['id'].toString());
    name = json['name'] ?? "";
    username = json['username'] ?? "";
    employeeIdFk = json['emp_id_fk'] ?? 0;
    twoFactorSecret = json['two_factor_secret'] ?? 0;
    groupIdFk = json['group_id_fk'] ?? 0;
    companyIdFk = json['company_id_fk'] ?? 0;
    projectIdFk = json['project_id_fk'] ?? 0;
    projectTypeIdIk = json['project_type_id_fk'] ?? 0;
    status = json['status'] ?? 0;
    email = json['email'] ?? "";
    branchId = json['branchId'] == null ? 0 : int.parse(json['branchId'].toString());
    roleId = json['role_id'] == null ? 0 : int.parse(json['role_id'].toString());
    twoFactorRecoveryCodes = json['two_factor_recovery_codes'] == null ? '' : json['two_factor_recovery_codes'].toString();
    suppCode = json['supp_code'] == null ? '' : json['supp_code'].toString();
    createdAt = json['created_at'] == null ? '' : json['created_at'].toString();
    updatedAt = json['updated_at'] == null ? '' : json['updated_at'].toString();

    try{
      softwareDate = json['softwareDate'] ?? '';
    }
    catch(_) {}

    try{
      roleName = json['roleName'] ?? '';
    }
    catch(_) {}

    try{
      accessToken = json['access_token'] ?? "";
    }
    catch(_) {}

    try{
      tokenType = json['token_type'] ?? "";
    }
    catch(_) {}
  }

  toJson() {

    return {
      "id" : id ?? "0",
      "name" : name ?? "",
      "username" : username ?? "",
      "emp_id_fk" : employeeIdFk ?? 0,
      "email" : email ?? "",
      "status" : status ?? 0,
      "branchId" : branchId ?? "0",
      "role_id" : roleId ?? "0",
      "softwareDate" : softwareDate ?? "",
      "roleName" : roleName ?? "",
      "access_token" : accessToken ?? "",
      "token_type" : tokenType ?? "",
      'two_factor_recovery_codes': twoFactorRecoveryCodes ?? '',
      'supp_code': suppCode ?? '',
      'created_at': createdAt ?? '',
      'updated_at': updatedAt ?? '',
    };
  }
}