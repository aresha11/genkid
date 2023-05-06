/// firstName : "mohamed fawzi"
/// age : 22
/// id : "c2bd693e-efca-4a3f-be13-6e013114a283"
/// userName : "ar1001@gmail.com"
/// normalizedUserName : "AR1001@GMAIL.COM"
/// email : "ar1001@gmail.com"
/// normalizedEmail : "AR1001@GMAIL.COM"
/// emailConfirmed : false
/// passwordHash : "AQAAAAEAACcQAAAAENNVzfVoWpYtnY5RfxjAVoDBpq0ROuLyS8E5+OcIfjikiK39UiRepKWMvlpMftddUQ=="
/// securityStamp : "KEQI6HSOSS6CKRCX3WNGTQYQK2EYKXKY"
/// concurrencyStamp : "46c9fc17-2338-4200-a7a4-177a758b4775"
/// phoneNumber : null
/// phoneNumberConfirmed : false
/// twoFactorEnabled : false
/// lockoutEnd : null
/// lockoutEnabled : true
/// accessFailedCount : 0

class UserInformationModel {
UserInformationModel();
  // UserInformationModel(
  //     this.firstName,
  //     this.age,
  //     this.id,
  //     this.userName,
  //     this.normalizedUserName,
  //     this.email,
  //     this.normalizedEmail,
  //     this.emailConfirmed,
  //     this.passwordHash,
  //     this.securityStamp,
  //     this.concurrencyStamp,
  //     this.phoneNumber,
  //     this.phoneNumberConfirmed,
  //     this.twoFactorEnabled,
  //     this.lockoutEnd,
  //     this.lockoutEnabled,
  //     this.accessFailedCount);

  UserInformationModel.fromJson(Map<String,dynamic> json) {
    firstName = json['firstName'];
    age = json['age'];
    id = json['id'];
    userName = json['userName'];
    normalizedUserName = json['normalizedUserName'];
    email = json['email'];
    normalizedEmail = json['normalizedEmail'];
    emailConfirmed = json['emailConfirmed'];
    passwordHash = json['passwordHash'];
    securityStamp = json['securityStamp'];
    concurrencyStamp = json['concurrencyStamp'];
    phoneNumber = json['phoneNumber'];
    phoneNumberConfirmed = json['phoneNumberConfirmed'];
    twoFactorEnabled = json['twoFactorEnabled'];
    lockoutEnd = json['lockoutEnd'];
    lockoutEnabled = json['lockoutEnabled'];
    accessFailedCount = json['accessFailedCount'];
  }
  String? firstName;
  num? age;
  String? id;
  String? userName;
  String? normalizedUserName;
  String? email;
  String? normalizedEmail;
  bool? emailConfirmed;
  String? passwordHash;
  String? securityStamp;
  String? concurrencyStamp;
  dynamic phoneNumber;
  bool? phoneNumberConfirmed;
  bool? twoFactorEnabled;
  dynamic lockoutEnd;
  bool? lockoutEnabled;
  num? accessFailedCount;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = firstName;
    map['age'] = age;
    map['id'] = id;
    map['userName'] = userName;
    map['normalizedUserName'] = normalizedUserName;
    map['email'] = email;
    map['normalizedEmail'] = normalizedEmail;
    map['emailConfirmed'] = emailConfirmed;
    map['passwordHash'] = passwordHash;
    map['securityStamp'] = securityStamp;
    map['concurrencyStamp'] = concurrencyStamp;
    map['phoneNumber'] = phoneNumber;
    map['phoneNumberConfirmed'] = phoneNumberConfirmed;
    map['twoFactorEnabled'] = twoFactorEnabled;
    map['lockoutEnd'] = lockoutEnd;
    map['lockoutEnabled'] = lockoutEnabled;
    map['accessFailedCount'] = accessFailedCount;
    return map;
  }


}