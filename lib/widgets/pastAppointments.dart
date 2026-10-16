import 'package:asu_quickcare/models/doctor.dart';
import 'package:asu_quickcare/models/student_appointment.dart';
import 'package:flutter/material.dart';

class PastAppointments extends StatefulWidget {
  const PastAppointments({super.key});

  @override
  State<PastAppointments> createState() => _PastAppointmentsState();
}

Map<int, String> days = {
  0: "Sun",
  1: "Mon",
  2: "Tue",
  3: "Wed",
  4: "Thu",
};

class _PastAppointmentsState extends State<PastAppointments> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: studentAppointments.length,
      itemBuilder: (context, index) {
        final appointment = studentAppointments[index];

        if (appointment.date.isBefore(DateTime.now())) {
          return Column(
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
                              //Some action
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            contentPadding: const EdgeInsets.all(10),
                            tileColor: const Color.fromARGB(255, 255, 255, 255),
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
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
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
                                            days[appointment.date.weekday % 7]
                                                .toString(),
                                            style:
                                                const TextStyle(fontSize: 10)),
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
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
