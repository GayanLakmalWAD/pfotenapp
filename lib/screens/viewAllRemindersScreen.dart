import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:pfoten/utils/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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
                        DateTime.now().add(Duration(days: 3)),
                        DateTime.now().add(Duration(days: 4)),
                        DateTime.now().add(Duration(days: 7))
                      ],
                      onDateChange: (date) {
                        // // New date selected
                        // setState(() {
                        //   _selectedValue = date;
                        // });
                      },
                    ),
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

  ///open datepicker
  openDatePicker(){
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
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
                          width: 80.w,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10)
                              ),
                              color: primaryColor
                          ),
                          child: Center(
                            child: Text(
                              'Select',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.sp,
                                  color: colorWhite
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
          );
        }
    );
  }

  ///today notes
  Widget todayNotes(){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 15, right: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "29/03/2022",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
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
              padding: const EdgeInsets.fromLTRB(10.0, 8.0, 10, 8.0),
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
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0,
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
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 0,
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
                              style: TextStyle(
                                color: const Color(0xffbdbdbd),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                letterSpacing: 0,
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
