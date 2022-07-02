import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pfoten/screens/choosePetScreen.dart';
import 'package:pfoten/screens/signIn_screen.dart';
import 'package:sizer/sizer.dart';
import '../reuasble/customAppBar.dart';
import '../reuasble/customTextField.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import '../utils/textStyles.dart';
import 'getPetDetailsScreen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Sign Up",
        isBackButtonExist: true,
        isAction: false,
        backOnTap: () {
          Navigator.pop(context);
        },
        iconData: Icons.create_outlined,
        iconOnTap: () {},
      ),
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                top: Dimensions.paddingDefault,
                left: Dimensions.paddingOverLarge,
                right: Dimensions.paddingOverLarge
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 2.h,
                ),
                CustomTextField(
                  isHint: true,
                  textFieldName: "User Name",
                  controller: nameController,
                  hint: "Mike Jane",
                  typedText: nameController.text,
                  obscureText: false,
                  onSubmit: (){

                  },
                  onChangedText: (test){

                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomTextField(
                  isHint: true,
                  textFieldName: "Email",
                  controller: emailController,
                  hint: "jane@gmail.com",
                  typedText: emailController.text,
                  obscureText: false,
                  onSubmit: (){

                  },
                  onChangedText: (test){

                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomTextField(
                  isHint: true,
                  textFieldName: "Password",
                  controller: passwordController,
                  hint: "x x x x x",
                  typedText: passwordController.text,
                  obscureText: true,
                  onSubmit: (){

                  },
                  onChangedText: (test){

                  },
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text.rich(
                    TextSpan(
                        children: [
                          TextSpan(
                            text: "By signInUp you're agree to our ",
                            style: robotoRegularTextStyle.copyWith(
                                fontSize: Dimensions.fontSizeExtraSmall
                            ),
                          ),
                          TextSpan(
                            text: "Terms & Conditions and Privacy Policy",
                            style: robotoRegularTextStyle.copyWith(
                                fontSize: Dimensions.fontSizeExtraSmall,
                                height: 1.5
                            ),
                          ),
                        ]
                    )
                ),
                SizedBox(
                  height: 3.h,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const GetPetDetailsScreen()),
                    );
                  },
                  child: Container(
                    height: 45,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(10)
                        ),
                        color: primaryColor
                    ),
                    child: Center(
                      child: Text(
                        'SIGN UP',
                        style: robotoBoldTextStyle.copyWith(
                            fontSize: Dimensions.fontSizeDefault,
                            color: kColorWhite
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 4.h, bottom: 2.h),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text.rich(
                        TextSpan(
                            children: [
                              TextSpan(
                                text: "Joined us before? ",
                                style: robotoRegularTextStyle.copyWith(
                                    fontSize: Dimensions.fontSizeExtraSmall
                                ),
                              ),
                              TextSpan(
                                text: "SIGN IN",
                                recognizer: TapGestureRecognizer()..onTap = () {

                                  // //set obscure text true
                                  // Provider.of<CommonProvider>(context, listen: false).isObscureTextPassword = true;

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => SignInScreen()),
                                  );
                                },
                                style: robotoRegularTextStyle.copyWith(
                                    fontSize: Dimensions.fontSizeExtraSmall
                                ),
                              ),
                            ]
                        )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
