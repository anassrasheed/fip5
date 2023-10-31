import 'dart:convert';

class LoginResponse {
  bool? success;
  int? code;
  String? message;
  ApiUser? result;

  LoginResponse({
    this.success,
    this.code,
    this.message,
    this.result,
  });

  factory LoginResponse.fromJson(String str) => LoginResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
    success: json["success"],
    code: json["code"],
    message: json["message"],
    result: json["result"] == null ? null : ApiUser.fromMap(json["result"]),
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "code": code,
    "message": message,
    "result": result?.toMap(),
  };
}

class ApiUser {
  int? masterCustomerInformationId;
  int? lookupCountryId;
  int? lookupCurrencyId;
  int? lookupCityId;
  int? lookupAreaId;
  String? masterCustomerInformationFullName;
  String? masterCustomerInformationMobileNo;
  dynamic masterCustomerInformationWhatsAppNo;
  String? masterCustomerInformationUserName;
  dynamic masterCustomerInformationEmail;
  dynamic masterCustomerInformationAddress;
  dynamic masterCustomerInformationFarmName;
  dynamic masterCustomerInformationFarmLogoUrl;
  dynamic masterCustomerInformationImageUrl;
  String? token;
  String? lookupLanguageId;
  bool? masterCustomerInformationIsNotification;
  bool? masterCustomerInformationNotificationSound;
  bool? masterCustomerInformationNotificationVibration;
  String? masterCustomerInformationCreateRegisterDate;
  String? masterCustomerInformationCreateRegisterDateTo;
  int? freeCountDay;
  bool? isFreeAddCamel;
  bool? isPlanRegister;
  int? sumOfCamels;
  int? countRemainder;
  bool? isExpired;
  dynamic transactionPlanCamelCustomer;

  ApiUser({
    this.masterCustomerInformationId,
    this.lookupCountryId,
    this.lookupCurrencyId,
    this.lookupCityId,
    this.lookupAreaId,
    this.masterCustomerInformationFullName,
    this.masterCustomerInformationMobileNo,
    this.masterCustomerInformationWhatsAppNo,
    this.masterCustomerInformationUserName,
    this.masterCustomerInformationEmail,
    this.masterCustomerInformationAddress,
    this.masterCustomerInformationFarmName,
    this.masterCustomerInformationFarmLogoUrl,
    this.masterCustomerInformationImageUrl,
    this.token,
    this.lookupLanguageId,
    this.masterCustomerInformationIsNotification,
    this.masterCustomerInformationNotificationSound,
    this.masterCustomerInformationNotificationVibration,
    this.masterCustomerInformationCreateRegisterDate,
    this.masterCustomerInformationCreateRegisterDateTo,
    this.freeCountDay,
    this.isFreeAddCamel,
    this.isPlanRegister,
    this.sumOfCamels,
    this.countRemainder,
    this.isExpired,
    this.transactionPlanCamelCustomer,
  });

  factory ApiUser.fromJson(String str) => ApiUser.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ApiUser.fromMap(Map<String, dynamic> json) => ApiUser(
    masterCustomerInformationId: json["masterCustomerInformationId"],
    lookupCountryId: json["lookupCountryId"],
    lookupCurrencyId: json["lookupCurrencyId"],
    lookupCityId: json["lookupCityId"],
    lookupAreaId: json["lookupAreaId"],
    masterCustomerInformationFullName: json["masterCustomerInformationFullName"],
    masterCustomerInformationMobileNo: json["masterCustomerInformationMobileNo"],
    masterCustomerInformationWhatsAppNo: json["masterCustomerInformationWhatsAppNo"],
    masterCustomerInformationUserName: json["masterCustomerInformationUserName"],
    masterCustomerInformationEmail: json["masterCustomerInformationEmail"],
    masterCustomerInformationAddress: json["masterCustomerInformationAddress"],
    masterCustomerInformationFarmName: json["masterCustomerInformationFarmName"],
    masterCustomerInformationFarmLogoUrl: json["masterCustomerInformationFarmLogoUrl"],
    masterCustomerInformationImageUrl: json["masterCustomerInformationImageUrl"],
    token: json["token"],
    lookupLanguageId: json["lookupLanguageId"],
    masterCustomerInformationIsNotification: json["masterCustomerInformationIsNotification"],
    masterCustomerInformationNotificationSound: json["masterCustomerInformationNotificationSound"],
    masterCustomerInformationNotificationVibration: json["masterCustomerInformationNotificationVibration"],
    masterCustomerInformationCreateRegisterDate: json["masterCustomerInformationCreateRegisterDate"],
    masterCustomerInformationCreateRegisterDateTo: json["masterCustomerInformationCreateRegisterDateTo"],
    freeCountDay: json["freeCountDay"],
    isFreeAddCamel: json["isFreeAddCamel"],
    isPlanRegister: json["isPlanRegister"],
    sumOfCamels: json["sumOfCamels"],
    countRemainder: json["countRemainder"],
    isExpired: json["isExpired"],
    transactionPlanCamelCustomer: json["transactionPlanCamelCustomer"],
  );

  Map<String, dynamic> toMap() => {
    "masterCustomerInformationId": masterCustomerInformationId,
    "lookupCountryId": lookupCountryId,
    "lookupCurrencyId": lookupCurrencyId,
    "lookupCityId": lookupCityId,
    "lookupAreaId": lookupAreaId,
    "masterCustomerInformationFullName": masterCustomerInformationFullName,
    "masterCustomerInformationMobileNo": masterCustomerInformationMobileNo,
    "masterCustomerInformationWhatsAppNo": masterCustomerInformationWhatsAppNo,
    "masterCustomerInformationUserName": masterCustomerInformationUserName,
    "masterCustomerInformationEmail": masterCustomerInformationEmail,
    "masterCustomerInformationAddress": masterCustomerInformationAddress,
    "masterCustomerInformationFarmName": masterCustomerInformationFarmName,
    "masterCustomerInformationFarmLogoUrl": masterCustomerInformationFarmLogoUrl,
    "masterCustomerInformationImageUrl": masterCustomerInformationImageUrl,
    "token": token,
    "lookupLanguageId": lookupLanguageId,
    "masterCustomerInformationIsNotification": masterCustomerInformationIsNotification,
    "masterCustomerInformationNotificationSound": masterCustomerInformationNotificationSound,
    "masterCustomerInformationNotificationVibration": masterCustomerInformationNotificationVibration,
    "masterCustomerInformationCreateRegisterDate": masterCustomerInformationCreateRegisterDate,
    "masterCustomerInformationCreateRegisterDateTo": masterCustomerInformationCreateRegisterDateTo,
    "freeCountDay": freeCountDay,
    "isFreeAddCamel": isFreeAddCamel,
    "isPlanRegister": isPlanRegister,
    "sumOfCamels": sumOfCamels,
    "countRemainder": countRemainder,
    "isExpired": isExpired,
    "transactionPlanCamelCustomer": transactionPlanCamelCustomer,
  };
}
