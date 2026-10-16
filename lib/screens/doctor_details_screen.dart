import 'package:asu_quickcare/models/doctor.dart';
import 'package:asu_quickcare/models/student.dart';
import 'package:asu_quickcare/models/student_appointment.dart';
import 'package:asu_quickcare/widgets/dateFormatSelection.dart';
import 'package:asu_quickcare/widgets/timeFormatSelection.dart';
import 'package:asu_quickcare/utils/date_utils.dart';
import 'package:flutter/material.dart';

class DoctorDetailsScreen extends StatefulWidget {
  final Doctor doctor;

  const DoctorDetailsScreen({super.key, required this.doctor});

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  Map<String, bool> isSelectedCol1 = {
    "9:00 am - 9:30 am": false,
    "9:30 am - 10:00 am": false,
    "10:00 am - 10:30 am": false,
    "10:30 am - 11:00 am": false,
    "11:00 am - 11:30 am": false,
  };
  Map<String, bool> isSelectedCol2 = {
    "11:30 am - 12:00 pm": false,
    "1:00 pm - 1:30 pm": false,
    "1:30 pm - 2:00 pm": false,
    "2:00 pm - 2:30 pm": false,
    "2:30 pm - 3:00 pm": false,
  };

  Map<String, bool> isSelectedDay = {
    "Sun": false,
    "Mon": false,
    "Tue": false,
    "Wed": false,
    "Thu": false,
  };
  Map<String, DateTime?> weekDates = {
    "Sun": null,
    "Mon": null,
    "Tue": null,
    "Wed": null,
    "Thu": null,
  };
  Map<int, String> weekDays = {
    0: "Sun",
    1: "Mon",
    2: "Tue",
    3: "Wed",
    4: "Thu",
  };

  bool checkEnable(key) {
    return weekDates[key]!.difference(DateTime.now()).inDays < 0;
    // return weekDates[key]!.difference(DateTime.parse("2024-12-3")).inDays < 0;
  }

  void bookedSuccessfullyPopup() {
    showDialog(
      context: context,
      builder: (context) {
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.pushNamed(context, "/homeScreen"); // Close the dialog
        });
        return AlertDialog(
          backgroundColor: Colors.white,
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ListView(
              shrinkWrap: true,
              children: const [
                Icon(
                  Icons.check_circle_outline,
                  size: 150,
                  color: Colors.green,
                ),
                SizedBox(height: 10),
                Text(
                  "Appointment Booked",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    DateTime currentDate = DateTime.now();
    DateTime firstSundayDate = currentDate;

    if (currentDate.weekday == 5 || currentDate.weekday == 6) {
      firstSundayDate = findNextSunday(currentDate);
      isSelectedDay["Sun"] = true;
    } else {
      firstSundayDate = findFirstDateOfTheWeek(currentDate);
      isSelectedDay[weekDays[currentDate.weekday % 7]!] = true;
    }

    int counter = 0;
    for (String key in weekDates.keys) {
      weekDates[key] = firstSundayDate.add(Duration(days: counter));
      counter++;
    }
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 64,
        toolbarHeight: 64,
        title: const Text(
          "Details",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff882020),
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2)),
                ],
              ),
              child: const BackButton(
                color: Color(0xff882020),
              ),
            ),
          ],
        ),
      ),
      body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 20,
                bottom: 10,
                right: 10,
              ),
              decoration: const BoxDecoration(
                color: Color(0xff882020),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(100),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 175,
                        child: Text(
                          widget.doctor.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 124,
                            child: Text(
                              widget.doctor.specialty,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          // Row(
                          //   children: [
                          //     Icon(
                          //       Icons.star,
                          //       color: Colors.amber,
                          //     ),
                          //     Text(
                          //       "4.4",
                          //       style: TextStyle(
                          //         color: Colors.white,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Text(
                        "Visiting Hours",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        "9 am - 3 pm",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(width: 4, color: Colors.white),
                      borderRadius: BorderRadius.circular(9999),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(9999),
                      child: Image(
                        image: NetworkImage(widget.doctor.imageURL),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      for (String key in isSelectedDay.keys)
                        GestureDetector(
                          onTap: checkEnable(key)
                              ? null
                              : () {
                                  setState(() {
                                    isSelectedDay.updateAll(
                                        (time, value) => value = false);
                                    isSelectedCol1.updateAll(
                                        (time, value) => value = false);
                                    isSelectedCol2.updateAll(
                                        (time, value) => value = false);
                                    isSelectedDay[key] = !isSelectedDay[key]!;
                                  });
                                },
                          child: DateComponent(
                            day: key,
                            date: weekDates[key]!.day.toString(),
                            isSelected: isSelectedDay[key]!,
                            isEnable: checkEnable(key),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 280,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            for (String key in isSelectedCol1.keys)
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSelectedCol2.updateAll(
                                        (time, value) => value = false);
                                    isSelectedCol1.updateAll(
                                        (time, value) => value = false);
                                    isSelectedCol1[key] = !isSelectedCol1[key]!;
                                  });
                                },
                                child: TimeComponent(
                                  time: key,
                                  isSelected: isSelectedCol1[key]!,
                                ),
                              ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (String key in isSelectedCol2.keys)
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSelectedCol1.updateAll(
                                        (time, value) => value = false);
                                    isSelectedCol2.updateAll(
                                        (time, value) => value = false);
                                    isSelectedCol2[key] = !isSelectedCol2[key]!;
                                  });
                                },
                                child: TimeComponent(
                                  time: key,
                                  isSelected: isSelectedCol2[key]!,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        String selectedDay = isSelectedDay.keys
                            .firstWhere((key) => isSelectedDay[key]! == true);
                        String? selectedTime;
                        try {
                          selectedTime = isSelectedCol1.keys.firstWhere(
                              (key) => isSelectedCol1[key]! == true);
                        } catch (e) {
                          try {
                            selectedTime = isSelectedCol2.keys.firstWhere(
                                (key) => isSelectedCol2[key]! == true);
                          } catch (e2) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please select a time"),
                              ),
                            );
                          }
                        }

                        addStudentAppointment(
                            weekDates[selectedDay]!,
                            selectedTime!,
                            widget.doctor.id,
                            currentStudent!.id);
                        bookedSuccessfullyPopup();
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(
                            const Color(0xff882020)),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          "Book Now",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
