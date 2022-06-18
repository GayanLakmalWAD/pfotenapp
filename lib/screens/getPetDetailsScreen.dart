import 'dart:io';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:pfoten/responsive.dart';
import 'package:pfoten/reuasble/customAppBar.dart';
import 'package:pfoten/reuasble/customTextField.dart';
import 'package:pfoten/screens/homeScreen.dart';
import 'package:pfoten/utils/colors.dart';
import 'package:pfoten/utils/dimensions.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

import 'bottom_Nav.dart';

class GetPetDetailsScreen extends StatefulWidget {
  const GetPetDetailsScreen({Key? key}) : super(key: key);

  @override
  _GetPetDetailsScreenState createState() => _GetPetDetailsScreenState();
}

class _GetPetDetailsScreenState extends State<GetPetDetailsScreen> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final genderController = TextEditingController();
  final weightController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String dob = "N/A";

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  bool? validateMobile(String value) {
    if (value.length < 9) {
      return false;
    } else {
      return null;
    }
  }

  bool? validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern as String);
    if (!regex.hasMatch(value)) {
      return false;
    } else {
      return null;
    }
  }

  String? selectedValue;
  List<String> items = [
    'Male',
    'Female',
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(
        title: "Pet Details",
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
                Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Stack(
                          children: [
                            GestureDetector(
                              onTap: (){
                                // _showPicker(context);
                              },
                              child: CircleAvatar(
                                radius: 60.sp,
                                backgroundColor: primaryColor,
                                child: Image.asset("images/dog.png"),
                                // _imageFile == null ?
                                // CircleAvatar(
                                //   radius: 20,
                                //   backgroundColor: Colors.white.withOpacity(0.5),
                                //   backgroundImage:
                                // ) :
                                // CircleAvatar(
                                //   radius: widthScale * 20,
                                //   backgroundColor: Colors.white,
                                //   backgroundImage: FileImage(File(_imageFile!.path)),
                                // ),
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                right: 15,
                                child: CircleAvatar(
                                  backgroundColor: secondaryColor,
                                  radius: 16.sp,
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: primaryColor,
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        // _showPicker(context);
                                      },
                                      icon: Icon(Icons.camera_alt_rounded, size: 14.sp,),
                                      color: Colors.white,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Dimensions.paddingDefault),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                          children: [
                            CustomTextField(
                              isHint: true,
                              textFieldName: "Name",
                              controller: nameController,
                              hint: "Shadow",
                              typedText: nameController.text,
                              obscureText: false,
                              onSubmit: (){

                              },
                              onChangedText: (test){
                                Future.delayed(const Duration(milliseconds: 1), () {
                                  setState(() {
                                    if (nameController.text != test) {
                                      test = nameController.text;
                                      print("New value inserted in firstNameController ${nameController.text}");
                                    }
                                  });
                                });

                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingDefault),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Date of Birth",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      DatePicker.showDatePicker(context,
                                        showTitleActions: true,
                                        minTime: DateTime(2000, 1, 1),
                                        maxTime: DateTime.now(),
                                        theme: DatePickerTheme(
                                          headerColor: primaryColor,
                                          backgroundColor: kColorWhite,
                                          cancelStyle: TextStyle(
                                              color: secondaryColor,
                                              fontSize: 14.sp),
                                          itemStyle: TextStyle(
                                              color: kColorBlack,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13.sp),
                                          doneStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.sp
                                          ),
                                        ),
                                        onChanged: (date) {
                                          setState(() {
                                            dob = DateFormat('MMM d, yyyy').format(date).toString();
                                          });
                                        }, onConfirm: (date) {
                                          setState(() {
                                            dob = DateFormat('MMM d, yyyy').format(date).toString();
                                          });
                                        }, currentTime: DateTime.now(),);
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 100.w,
                                      color: scaffoldBackgroundColor,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '$dob',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                      height: 1,
                                      color: primaryColor
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Gender",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      DropdownSearch<String>(
                                        mode: Mode.MENU,
                                        showSelectedItems: false,
                                        selectedItem: selectedValue,
                                        items: const ["Male", "Female"],
                                        dropdownSearchDecoration:  const InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: scaffoldBackgroundColor, width: 3),
                                          ),
                                          iconColor: kColorBlack,
                                        ),
                                        dropdownButtonProps: const IconButtonProps(
                                            icon: Icon(Icons.arrow_drop_down_outlined), color: kColorBlack),
                                        onChanged: (location) {

                                        },
                                        // selectedItem: "Brazil",
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Container(
                                          height: 1,
                                          color: primaryColor
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Expanded(
                                  child: CustomTextField(
                                    isHint: true,
                                    textFieldName: "Weight",
                                    controller: weightController,
                                    hint: "10 kg",
                                    typedText: weightController.text,
                                    obscureText: false,
                                    onSubmit: (){

                                    },
                                    onChangedText: (test){
                                      Future.delayed(const Duration(milliseconds: 1), () {
                                        setState(() {
                                          if (weightController.text != test) {
                                            test = weightController.text;
                                            print("New value inserted in firstNameController ${weightController.text}");
                                          }
                                        });
                                      });

                                    },
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: Text(
                                "You can add more pets later :)",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 10.sp
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: Center(
                                child: GestureDetector(
                                  onTap: (){
                                    ///validate all the feilds then skip alert>>>>
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => MyHomePage()),
                                    );
                                  },
                                  child: Container(
                                    height: 45,
                                    width: 80.w,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)
                                        ),
                                        color: primaryColor
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Continue',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13.sp,
                                            color: kColorWhite
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}