import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:pfoten/reuasble/customTextField.dart';
import 'package:pfoten/utils/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:weekday_selector/weekday_selector.dart';
import '../reuasble/customAppBar.dart';
import '../utils/dimensions.dart';
import '../utils/textStyles.dart';

class CreateEditReminderScreen extends StatefulWidget {
  const CreateEditReminderScreen({Key? key}) : super(key: key);

  @override
  _CreateEditReminderScreenState createState() => _CreateEditReminderScreenState();
}

class _CreateEditReminderScreenState extends State<CreateEditReminderScreen> {

  final titleController = TextEditingController();
  bool repeatOrOnce = false;
  List<bool> values = List.filled(7, false);
  final ScrollController listController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Add Reminder",
        isBackButtonExist: true,
        isAction: false,
        backOnTap: () {
          Navigator.pop(context);
        },
        iconData: Icons.create_outlined,
        iconOnTap: () {},
      ),
      body: SingleChildScrollView(
        controller: listController,
        child: Container(
          width: 100.w,
          decoration: const BoxDecoration(
            color: scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Reminder Type",
                  textAlign: TextAlign.left,
                  style: robotoBoldTextStyle.copyWith(
                    fontSize: Dimensions.fontSizeDefault
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 12.h,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: GestureDetector(
                          onTap: (){

                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Icon(Icons.eighteen_mp, size: 40,),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Medicine',
                                    style: robotoRegularTextStyle.copyWith(
                                        fontSize: Dimensions.fontSizeExtraSmall,
                                        fontWeight: FontWeight.w300
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                CustomTextField(
                  controller: titleController,
                  isHint: true,
                  hint: "Vet Meetup",
                  textFieldName: "Reminder Name",
                  onChangedText: (dsf){
                  },
                  obscureText: false,
                  onSubmit: (){

                  },
                ),
                const SizedBox(
                  height: 30,
                ),

                ExpandablePanel(
                  header: Text(
                    "Additional Note",
                    textAlign: TextAlign.left,
                    style: robotoBoldTextStyle.copyWith(
                        fontSize: Dimensions.fontSizeDefault
                    ),
                  ),
                  collapsed: const Text("Add an additional note if you want", softWrap: true),
                  expanded: TextField(
                    // controller: widget.controller,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 12.sp,
                    ),
                    textCapitalization: TextCapitalization.sentences,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: secondaryColor),
                      ),
                      labelStyle:  TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 12.sp,
                      ),
                    ),
                    onChanged: (sdf){

                    },
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Date And Time",
                  textAlign: TextAlign.left,
                  style: robotoBoldTextStyle.copyWith(
                      fontSize: Dimensions.fontSizeDefault
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: SlidingSwitch(
                    value: false,
                    width: 250,
                    onChanged: (bool value) {
                      print(value);
                      setState(() {
                        repeatOrOnce = value;
                      });

                      ///scroll to last index
                      Future.delayed(const Duration(milliseconds: 300), () async {
                        listController.animateTo(
                          listController.position.maxScrollExtent,
                          duration: const Duration(milliseconds: 800),
                          curve: Curves.fastOutSlowIn,
                        );
                      });
                    },
                    height : 55,
                    animationDuration : const Duration(milliseconds: 400),
                    onTap:(){},
                    onDoubleTap:(){},
                    onSwipe:(){},
                    textOff : "Repeat",
                    textOn : "Once",
                    colorOn : secondaryColor,
                    colorOff : secondaryColor,
                    background : const Color(0xffe4e5eb),
                    buttonColor : const Color(0xfff7f5f7),
                    inactiveColor : const Color(0xff636f7b),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                repeatOrOnce
                    ? Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      '5 : 25 PM',
                      style: robotoBoldTextStyle.copyWith(
                          fontSize: Dimensions.fontSizeExtraLarge,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SfDateRangePicker(
                      view: DateRangePickerView.month,
                      selectionColor: secondaryColor,
                      monthViewSettings: const DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
                    ),
                  ],
                )
                    : Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      '5 : 25 PM',
                      style: robotoBoldTextStyle.copyWith(
                        fontSize: Dimensions.fontSizeExtraLarge,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    WeekdaySelector(
                      selectedFillColor: secondaryColor,
                      onChanged: (int day) {
                        setState(() {
                          // Set all values to false except the "day"th element
                          values = List.filled(7, false, growable: false)..[day % 7] = true;
                        });
                      },
                      values: values,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Center(
                    child: GestureDetector(
                      onTap: (){

                      },
                      child: Container(
                        height: 45,
                        width: 45.w,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10)
                            ),
                            color: primaryColor
                        ),
                        child: Center(
                          child: Text(
                            'Save',
                            style: robotoBoldTextStyle.copyWith(
                                fontSize: Dimensions.fontSizeDefault,
                                color: kColorWhite
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
