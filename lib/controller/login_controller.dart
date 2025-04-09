import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../common/utils.dart';
import '../model/user_model.dart';
import '../view/login/sign_in_view.dart';

class LoginController extends GetxController{
  final _isLoading=RxBool(false);
  final _firebaseAuth=FirebaseAuth.instance;
  final _firebaseInstance=FirebaseFirestore.instance;
  final _userModel=Rxn<UserModel>();




  Future<void> login({required String email, required String password}) async {
    _isLoading(true);
    try {
      final result = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      if (result.user != null) {
        await getUserData(uid: result.user!.uid);

        print('sssss${_userModel.value?.status}');

        print('user model is is is ${_userModel.value?.status} and name is is s ${_userModel.value?.companyName}');
        // if(_userModel.value!=null){
        //   print('kokoko');
        //   if (_userModel.value?.status == 0) {
        //     print('ok ok 0 ');
        //
        //     Get.offAll(()=>const TabBarScreen());
        //     Utils.myToast(title: 'Login Success');
        //   }
        //   else if (_userModel.value?.status == 1) {
        //     print('ok ok1 ');
        //
        //     print('yes admin !');
        //     Get.offAll(() => const MainAdminScreen());
        //     Utils.myToast(title: 'Login Success');
        //   }
        //   else if(_userModel.value?.status==2){
        //     print('ok ok2 ');
        //     Get.offAll(()=>const CompanyHomeScreen());
        //
        //   }
        // }
      }
      else {
        Utils.myToast(title: 'Login Failed');
      }
    } catch (e) {
      print('there is an error in login $e');
      Utils.myToast(title: 'Login Failed');
    }
    _isLoading(false);
  }

  Future<void> getUserData({required String uid}) async {
    try {
      final result =
      await _firebaseInstance.collection('users').doc(uid).get();
      if (result.data() != null) {
        _userModel(UserModel.fromJson(result.data()!));
      } else {
        _userModel(null);
        Utils.myToast(title: 'Please Check your network!');
      }
    } catch (e) {
      print('there is an error in get user Data $e');
    }
  }

  Future<void> createAccount({required String email, required String name, required String password, required String phoneNumber,
    int status = 0,
    required String age,
    required String description,
    required String major,
    required String gender})
  async {
    _isLoading(true);
    try {
      final auth = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (auth.user != null) {
        await saveDataToFireStore(
            email: email,
            name: name,
            phone: phoneNumber,
            uid: auth.user!.uid,
            status: status,
            age: age,
            description: description,
            major: major,
            gender: gender);

        Get.offAll(() => const SignInView());
      } else {
        Utils.myToast(title: 'Register Failed');
      }
    } catch (e) {
      print('there is an error $e');
      Utils.myToast(title: 'Register Failed');
    }
    _isLoading(false);
  }

  Future<void> forgetPassword({required String email})async{
    _isLoading(true);
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value){
      Utils.myToast(title: 'Please Check Your Email 1');
    }).catchError((error){
      Utils.myToast(title: 'Check Your Internet');
    });
    _isLoading(false);


  }

  Future<void> saveDataToFireStore(
      {required String email,
        required String name,
        required String phone,
        required String uid,
        dynamic status,
        required String description,
        required String age,
        required String major,
        required String gender})
  async {
    try {
      final store =
      await _firebaseInstance.collection('users').doc(uid).set({
        'email': email,
        'user_name': name,
        'mobile_number': phone,
        'uid': uid,
        'status': 0, //1 FOR ADMIN AND 0 USER AND 2 FOR COMPANY
        'age': age,
        'description': description,
        'major': major,
        'gender': gender,
        'profile_image': gender == 'Male'
            ? 'https://static.vecteezy.com/system/resources/thumbnails/051/948/045/small_2x/a-smiling-man-with-glasses-wearing-a-blue-sweater-poses-warmly-against-a-white-background-free-photo.jpeg'
            : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRC6R4Gt9B7p36ZaS8rhWwq-yF4iUpakWPCWA&s'
      });
      Utils.myToast(title: 'Register Success');
    } catch (e) {
      print('There is an error in saveDataToFireStore method ');
    }
  }

}