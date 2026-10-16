import 'package:asu_quickcare/models/doctor.dart';
import 'package:asu_quickcare/models/student_appointment.dart';
import 'package:asu_quickcare/screens/reschedule_appointment.dart';
import 'package:asu_quickcare/utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class UpcomingAppointments extends StatefulWidget {
  const UpcomingAppointments({super.key});

  @override
  State<UpcomingAppointments> createState() => _UpcomingAppointmentsState();
}

class _UpcomingAppointmentsState extends State<UpcomingAppointments> {
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
    // return weekDates[key]!.difference(DateTime.parse("2024-12-3")).inDays < 0;
  }

  @override
  void initState() {
    DateTime currentDate = DateTime.now();
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

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: studentAppointments.length,
      itemBuilder: (context, index) {
        final appointment = studentAppointments[index];
        void onDismissed(int index) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                title: Column(
                  children: [
                    /*  Icon(
                      Icons.warning_amber_rounded,
                      color: Color.fromRGBO(136, 32, 32, 1),
                      size: 40.0,
                    ),*/
                    Opacity(
                      opacity: 0.5,
                      child: Image(
                        image: AssetImage(
                          "assets/waring.png",
                        ),
                        width: 50,
                        height: 50,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Cancel Appointment",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                content: Text("Are you sure you want to continue?"),
                actions: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(120, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(3), // Makes the button square
                      ),
                      backgroundColor: Color.fromARGB(255, 199, 199, 199),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Close",
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(120, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(3), // Makes the button square
                      ),
                      backgroundColor: Color.fromRGBO(136, 32, 32, 1),
                    ),
                    onPressed: () {
                      setState(() {
                        studentAppointments.removeAt(index);
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              );
            },
          );
        }

        if (appointment.date.difference(DateTime.now()).inDays >= 0) {
          return Slidable(
            startActionPane:
                ActionPane(motion: const StretchMotion(), children: [
              SlidableAction(
                  backgroundColor: Color.fromRGBO(136, 32, 32, 1),
                  icon: Icons.cancel,
                  label: "Cancel",
                  onPressed: (context) => onDismissed(index)),
            ]),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width -
                            40, //-40 because we margin 20 on each sides, not sure if this is a universal solution
                        child: Center(
                          child: PhysicalModel(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            elevation: 8,
                            shadowColor: const Color.fromARGB(144, 0, 0, 0),
                            borderRadius: BorderRadius.circular(20),
                            child: ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          RescheduleAppointment(
                                              appointment: appointment),
                                    ));
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              contentPadding: const EdgeInsets.all(10),
                              tileColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              title: Text(
                                doctors
                                    .firstWhere((doctor) =>
                                        doctor.id == appointment.doctorId)
                                    .name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 20),
                              ),
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(doctors
                                      .firstWhere((doctor) =>
                                          doctor.id == appointment.doctorId)
                                      .specialty),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    appointment.time,
                                    style: const TextStyle(
                                        color: Color.fromRGBO(136, 32, 32, 1),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  )
                                ],
                              ),
                              trailing: Transform.scale(
                                scale: 1.7,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 18),
                                  child: PhysicalModel(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    elevation: 8,
                                    shadowColor:
                                        const Color.fromARGB(25, 0, 0, 0),
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      width: 53,
                                      height: 100,
                                      padding: const EdgeInsets.only(
                                          right: 2.5, top: 3.5),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        gradient: const RadialGradient(
                                            radius: 2.5,
                                            colors: <Color>[
                                              Colors.white,
                                              Color.fromARGB(255, 190, 190, 190)
                                            ]),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          // The % 7 is to make sure that sunday is 0 not 7
                                          Text(
                                              weekDays[
                                                      appointment.date.weekday %
                                                          7]
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 10)),
                                          Text(
                                            appointment.date.day.toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
