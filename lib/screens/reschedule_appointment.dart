import 'package:asu_quickcare/models/doctor.dart';
import 'package:asu_quickcare/models/student_appointment.dart';
import 'package:asu_quickcare/utils/date_utils.dart';
import 'package:asu_quickcare/widgets/dateFormatSelection.dart';
import 'package:asu_quickcare/widgets/timeFormatSelection.dart';
import 'package:flutter/material.dart';

class RescheduleAppointment extends StatefulWidget {
  final StudentAppointment appointment;

  const RescheduleAppointment({super.key, required this.appointment});

  @override
  State<RescheduleAppointment> createState() => _RescheduleAppointmentState();
}

class _RescheduleAppointmentState extends State<RescheduleAppointment> {
  Map<int, String> weekDays = {
    0: "Sun",
    1: "Mon",
    2: "Tue",
    3: "Wed",
    4: "Thu",
  };

  Map<String, DateTime?> weekDates = {
    "Sun": null,
    "Mon": null,
    "Tue": null,
    "Wed": null,
    "Thu": null,
  };

  Map<String, bool> isSelectedDay = {
    "Sun": false,
    "Mon": false,
    "Tue": false,
    "Wed": false,
    "Thu": false,
  };

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

  bool checkEnable(key) {
    return weekDates[key]!.difference(DateTime.now()).inDays < 0;
  }

  Doctor? doctor;

  @override
  void initState() {
    doctor = doctors.firstWhere((d) => d.id == widget.appointment.doctorId);

    DateTime currentDate = widget.appointment.date;
    // DateTime currentDate = DateTime.parse("2025-01-10");
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

    if (isSelectedCol1.containsKey(widget.appointment.time)) {
      isSelectedCol1[widget.appointment.time] = true;
    } else {
      isSelectedCol2[widget.appointment.time] = true;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 64,
        toolbarHeight: 64,
        title: const Text(
          "Reschedule Appointment",
          style: TextStyle(
            color: Color(0xff882020),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
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
                      color: Colors.black.withValues(alpha: 0.1),
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
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doctor!.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              doctor!.specialty,
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                for (String weekDay in weekDays.values)
                  GestureDetector(
                    onTap: checkEnable(weekDay)
                        ? null
                        : () {
                            setState(() {
                              isSelectedDay
                                  .updateAll((time, value) => value = false);
                              isSelectedCol1
                                  .updateAll((time, value) => value = false);
                              isSelectedCol2
                                  .updateAll((time, value) => value = false);
                              isSelectedDay[weekDay] = !isSelectedDay[weekDay]!;
                            });
                          },
                    child: DateComponent(
                      day: weekDay,
                      date: weekDates[weekDay]!.day.toString(),
                      isSelected: isSelectedDay[weekDay]!,
                      isEnable: checkEnable(weekDay),
                    ),
                  ),
              ],
            ),
            const SizedBox(
              height: 16,
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
                              isSelectedCol2
                                  .updateAll((time, value) => value = false);
                              isSelectedCol1
                                  .updateAll((time, value) => value = false);
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
                              isSelectedCol1
                                  .updateAll((time, value) => value = false);
                              isSelectedCol2
                                  .updateAll((time, value) => value = false);
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
            SizedBox(
              height: 24,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  String selectedDay = isSelectedDay.keys
                      .firstWhere((key) => isSelectedDay[key]! == true);
                  String? selectedTime;
                  try {
                    selectedTime = isSelectedCol1.keys
                        .firstWhere((key) => isSelectedCol1[key]! == true);
                  } catch (e) {
                    try {
                      selectedTime = isSelectedCol2.keys
                          .firstWhere((key) => isSelectedCol2[key]! == true);
                    } catch (e2) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please select a time"),
                        ),
                      );
                    }
                  }
                  setState(() {
                    rescheduleStudentAppointment(widget.appointment.id,
                        weekDates[selectedDay]!, selectedTime!);
                  });
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(
                      context, "/myAppointmentsScreen");
                },
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all<Color>(const Color(0xff882020)),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    "Save",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white,
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
}
