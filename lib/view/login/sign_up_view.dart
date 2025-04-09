import 'package:flutter/material.dart';
import 'package:spned_wise_new/view/login/sign_in_view.dart';


import '../../common/color_extension.dart';
import '../../common/utils.dart';
import '../../common_widget/primary_button.dart';
import '../../common_widget/round_textfield.dart';
import '../../common_widget/secondary_boutton.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtAge = TextEditingController();
  TextEditingController txtPhone= TextEditingController();




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
                const Spacer(),
                RoundTextField(
                  title: "E-mail address",
                  controller: txtEmail,
                  prefixIcon: Icon(Icons.email,color: Colors.white,),
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
                ),   const SizedBox(
                  height: 15,
                ),
                RoundTextField(
                  title: "Age",
                  prefixIcon: Icon(Icons.numbers,color: Colors.white,),
                  controller: txtAge,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 15,
                ),
                RoundTextField(
                  title: "Phone",
                  prefixIcon: Icon(Icons.phone,color: Colors.white,),

                  controller: txtPhone,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 5,
                        margin: const EdgeInsets.symmetric(horizontal: 1),
                        decoration: BoxDecoration(
                          color: TColor.gray70,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 5,
                        margin: const EdgeInsets.symmetric(horizontal: 1),
                        decoration: BoxDecoration(
                          color: TColor.gray70,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 5,
                        margin: const EdgeInsets.symmetric(horizontal: 1),
                        decoration: BoxDecoration(
                          color: TColor.gray70,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 5,
                        margin: const EdgeInsets.symmetric(horizontal: 1),
                        decoration: BoxDecoration(
                          color: TColor.gray70,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Text(
                //       "Use 8 or more characters with a mix of letters,\nnumbers & symbols.",
                //       style: TextStyle(color: TColor.gray50, fontSize: 12),
                //     ),
                //   ],
                // ),
                const SizedBox(
                  height: 20,
                ),
                PrimaryButton(
                  title: "Create Account",
                  onPressed: () {


                  },
                ),
                const Spacer(),
                Text(
                  "Do you have already an account?",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: TColor.white, fontSize: 14),
                ),
                const SizedBox(
                  height: 20,
                ),
                SecondaryButton(
                  title: "Sign in",
                  onPressed: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInView(),
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
