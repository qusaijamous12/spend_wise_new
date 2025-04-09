class UserModel {
  final dynamic userName;
  final dynamic email;
  final dynamic uid;
  final dynamic phoneNumber;
  final dynamic status;
  final dynamic age;
  final dynamic description;
  final dynamic major;
  final dynamic sendUid;
  final dynamic gender;
  final dynamic profileImage;
  final dynamic companyName;
  final dynamic companyOwnerName;
  final dynamic companyUrl;
  final dynamic industry;
  final dynamic latitude;
  final dynamic  longitude;
  final dynamic mobileNumber;
  final dynamic subCategory;
  final dynamic message;
  final dynamic user;


  UserModel({
    this.uid,
    this.phoneNumber,
    this.email,
    this.userName,
    this.user,
    this.status,
    this.age,
    this.description,
    this.major,
    this.sendUid,
    this.gender,
    this.profileImage,
    this.companyOwnerName,
    this.companyUrl,
    this.longitude,
    this.latitude,
    this.companyName,
    this.message,
    this.mobileNumber,
    this.industry,
    this.subCategory

  });

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
        uid: json['uid'],
        phoneNumber: json['mobile_number'] ?? '',
        email: json['email'] ?? '',
        status: json['status'] ?? '',
        userName: json['user_name'] ?? '',
        age: json['age'] ?? '',
        description: json['description'] ?? '',
        major: json['major'] ?? '',
        sendUid: json['send_uid'] ?? '',
        gender: json['gender'] ?? '',
        user: json['user'],
        profileImage: json['profile_image'] ?? '',
        companyName: json['company_name'],
        companyOwnerName: json['company_owner_name'],
        companyUrl: json['company_url'],
        industry: json['industry'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        message:json['message'],
        mobileNumber: json['mobile_number'],
        subCategory: json['sub_category']


    );
  }

}

