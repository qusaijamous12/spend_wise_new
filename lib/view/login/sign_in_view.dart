import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spned_wise_new/view/home/home_view.dart';

import 'package:spned_wise_new/view/login/sign_up_view.dart';

import '../../common/color_extension.dart';
import '../../common/utils.dart';
import '../../common_widget/primary_button.dart';
import '../../common_widget/round_textfield.dart';
import '../../common_widget/secondary_boutton.dart';
import '../main_tab/main_tab_view.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool isRemember = false;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: (){
        Utils.hideKeyboard(context);

      },
      onVerticalDragDown: (ss){
        Utils.hideKeyboard(context);
      },
      child: Scaffold(
        backgroundColor: TColor.gray,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image.asset("assets/img/app_logo.png",
                //     width: media.width * 0.5, fit: BoxFit.contain),
                Text(
                  'Spaend Wise',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const Spacer(),
                RoundTextField(
                  title: "Login",
                  prefixIcon: Icon(Icons.email,color: Colors.white,),
                  controller: txtEmail,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 15,
                ),
                RoundTextField(
                  title: "Password",
                  prefixIcon: Icon(Icons.lock_open,color: Colors.white,),
                  controller: txtPassword,
                  obscureText: true,
                ),

                 const SizedBox(
                  height: 8,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isRemember = !isRemember;
                        });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Icon(
                          //   isRemember
                          //       ? Icons.check_box_rounded
                          //       : Icons.check_box_outline_blank_rounded,
                          //   size: 25,
                          //   color: TColor.gray50,
                          // ),
                          const SizedBox(
                            width: 8,
                          ),
                          // Text(
                          //   "Remember me",
                          //   style: TextStyle(color: TColor.gray50, fontSize: 14),
                          // ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot password",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 8,
                ),

                PrimaryButton(
                  title: "Sign In",
                  onPressed: () {
                    Get.offAll(()=>const MainTabView());


                  },
                ),
                const Spacer(),
                Text(
                  "if you don't have an account yet?",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: TColor.white, fontSize: 14),
                ),
                const SizedBox(
                  height: 20,
                ),
                SecondaryButton(
                  title: "Sign up",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpView(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
