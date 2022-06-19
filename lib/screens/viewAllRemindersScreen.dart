import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:pfoten/utils/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../utils/dimensions.dart';
import '../utils/textStyles.dart';

class ViewAllRemindersScreen extends StatefulWidget {
  const ViewAllRemindersScreen({Key? key}) : super(key: key);

  @override
  _ViewAllRemindersScreenState createState() => _ViewAllRemindersScreenState();
}

class _ViewAllRemindersScreenState extends State<ViewAllRemindersScreen> {

  final ScrollController listController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        title: const Text("All Reminders"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            height: 50,
            width: 100.w,
            color: primaryColor,
          ),
          Container(
            width: 100.w,
            decoration: const BoxDecoration(
              color: scaffoldBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: SingleChildScrollView(
              controller: listController,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DatePicker(
                      DateTime.now(),
                      width: 60,
                      height: 80,
                      // controller: _controller,
                      initialSelectedDate: DateTime.now(),
                      selectionColor: Colors.black,
                      selectedTextColor: Colors.white,
                      inactiveDates: [
                        DateTime.now().add(const Duration(days: 3)),
                        DateTime.now().add(const Duration(days: 4)),
                        DateTime.now().add(const Duration(days: 7))
                      ],
                      onDateChange: (date) {
                        // // New date selected
                        // setState(() {
                        //   _selectedValue = date;
                        // });
                      },
                    ),
                    SizedBox(height: 1.h),
                    todayNotes(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///open date picker
  openDatePicker(){
    return showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue = Curves.easeInOutBack.transform(a1.value) -   1.0;
          return Transform(
            transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                content: SizedBox(
                  height: 50.h,
                  width: 100.w,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 100.w,
                        child: SfDateRangePicker(
                          backgroundColor: Colors.white,
                          // onSelectionChanged: print("heloo"),
                          selectionMode: DateRangePickerSelectionMode.single,
                          onSelectionChanged: (DateRangePickerSelectionChangedArgs args) async{

                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Center(
                          child: GestureDetector(
                            onTap: (){
                              ///validate all the feilds then skip alert>>>>
                              Navigator.pop(context);
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
                                  'Select',
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
        },
        transitionDuration: const Duration(milliseconds: 300),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
          return Container();
        }
    );
  }

  ///today notes
  Widget todayNotes(){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "29/03/2022",
                style: robotoBoldTextStyle.copyWith(
                  fontSize: Dimensions.fontSizeDefault,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.apps_sharp, color: primaryColor),
                onPressed: () {
                  openDatePicker();
                },
              ),
            ],
          ),
        ),
        ListView.builder(
          itemCount: 6,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                  width: 50.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 200,
                              child: Text(
                                "Vaccination",
                                style: robotoBoldTextStyle.copyWith(
                                  fontSize: Dimensions.fontSizeDefault,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(
                                "Sub topic",
                                style: robotoBoldTextStyle.copyWith(
                                  fontWeight: FontWeight.w300,
                                  fontSize: Dimensions.fontSizeExtraSmall,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "2022/10/06",
                              textAlign: TextAlign.left,
                              style: robotoBoldTextStyle.copyWith(
                                fontSize: Dimensions.fontSizeExtraSmall,
                                color: const Color(0xffbdbdbd),
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(Icons.notifications_active_outlined, color: primaryColor),
                      ],
                    ),
                  )
              ),
            );
          },
        ),
      ],
    );
  }
}
