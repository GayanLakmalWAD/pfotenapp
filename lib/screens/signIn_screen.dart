import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pfoten/screens/choosePetScreen.dart';
import 'package:pfoten/screens/signup_screen.dart';
import 'package:sizer/sizer.dart';
import '../reuasble/customAppBar.dart';
import '../reuasble/customTextField.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import '../utils/textStyles.dart';
import 'getPetDetailsScreen.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Sign In",
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
                        'SIGN IN',
                        style: robotoBoldTextStyle.copyWith(
                            fontSize: Dimensions.fontSizeDefault,
                            color: kColorWhite
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text.rich(
                        TextSpan(
                            children: [
                              TextSpan(
                                text: "New to Pfoten? ",
                                style: robotoRegularTextStyle.copyWith(
                                    fontSize: Dimensions.fontSizeExtraSmall
                                ),
                              ),
                              TextSpan(
                                text: "SIGN UP",
                                recognizer: TapGestureRecognizer()..onTap = () {

                                  // //set obscure text false
                                  // if(!Provider.of<CommonProvider>(context, listen: false).getIsObscureTextPassword){
                                  //   Provider.of<CommonProvider>(context, listen: false).isObscureTextPassword = true;
                                  // }


                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                                  );
                                },
                                style: robotoBoldTextStyle.copyWith(
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
