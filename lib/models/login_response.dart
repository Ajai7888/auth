class LoginResponse {
  final bool success;
  final int errorCode;
  final String errorMsg;
  final List<RolePermission>? rolePermissions;
  final RoleDetail? roleDetails;
  final UserDetail? userDetail;
  final String? token;
  final String? customerId;
  final String? passwordResetKey;

  LoginResponse({
    required this.success,
    required this.errorCode,
    required this.errorMsg,
    this.rolePermissions,
    this.roleDetails,
    this.userDetail,
    this.token,
    this.customerId,
    this.passwordResetKey,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'] ?? false,
      errorCode: json['errorCode'] ?? 0,
      errorMsg: json['errorMsg'] ?? '',
      rolePermissions:
          json['rolepermissions'] != null
              ? List<RolePermission>.from(
                json['rolepermissions'].map((x) => RolePermission.fromJson(x)),
              )
              : null,
      roleDetails:
          json['roleDetails'] != null
              ? RoleDetail.fromJson(json['roleDetails'])
              : null,
      userDetail:
          json['userDetail'] != null
              ? UserDetail.fromJson(json['userDetail'])
              : null,
      token: json['token'],
      customerId: json['customerId'],
      passwordResetKey: json['passwordresetkey'],
    );
  }
}

class RolePermission {
  final int roleid;
  final String description;
  final String modulename;
  final int moduleid;
  final String submodulename;
  final int submoduleid;
  final int addpermission;
  final int editpermission;
  final int viewpermission;
  final int listpermission;

  RolePermission({
    required this.roleid,
    required this.description,
    required this.modulename,
    required this.moduleid,
    required this.submodulename,
    required this.submoduleid,
    required this.addpermission,
    required this.editpermission,
    required this.viewpermission,
    required this.listpermission,
  });

  factory RolePermission.fromJson(Map<String, dynamic> json) {
    return RolePermission(
      roleid: json['roleid'],
      description: json['description'],
      modulename: json['modulename'],
      moduleid: json['moduleid'],
      submodulename: json['submodulename'],
      submoduleid: json['submoduleid'],
      addpermission: json['addpermission'],
      editpermission: json['editpermission'],
      viewpermission: json['viewpermission'],
      listpermission: json['listpermission'],
    );
  }
}

class RoleDetail {
  final int roleid;
  final String description;
  final dynamic icustomerid;

  RoleDetail({
    required this.roleid,
    required this.description,
    this.icustomerid,
  });

  factory RoleDetail.fromJson(Map<String, dynamic> json) {
    return RoleDetail(
      roleid: json['roleid'],
      description: json['description'],
      icustomerid: json['icustomerid'],
    );
  }
}

class UserDetail {
  final int userid;
  final String firstname;
  final String lastname;
  final String email;
  final String usertitle;
  final String userimageurl;

  UserDetail({
    required this.userid,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.usertitle,
    required this.userimageurl,
  });

  factory UserDetail.fromJson(Map<String, dynamic> json) {
    return UserDetail(
      userid: json['userid'],
      firstname: json['firstname'] ?? '',
      lastname: json['lastname'] ?? '',
      email: json['email'] ?? '',
      usertitle: json['usertitle'] ?? '',
      userimageurl: json['userimageurl'] ?? '',
    );
  }
}
