import 'package:asu_quickcare/models/student.dart';

class StudentAppointment {
  int id;
  DateTime date;
  String time;
  int doctorId;
  int studentId;

  StudentAppointment({
    required this.id,
    required this.date,
    required this.time,
    required this.doctorId,
    required this.studentId,
  });
}

List<StudentAppointment> studentAppointments = [
  StudentAppointment(
    id: 1,
    date: DateTime.utc(2024, 11, 27),
    time: "9:00 am - 9:30 am",
    doctorId: 1,
    studentId: currentStudent!.id,
  ),
  StudentAppointment(
    id: 2,
    date: DateTime.utc(2024, 12, 3),
    time: "2:30 pm - 3:00 pm",
    doctorId: 1,
    studentId: currentStudent!.id,
  ),
   StudentAppointment(
    id: 3,
    date: DateTime.utc(2025, 11, 27),
    time: "9:00 am - 9:30 am",
    doctorId: 1,
    studentId: currentStudent!.id,
  ),
];

void addStudentAppointment(
    DateTime date, String time, int doctorId, int studentId) {
  studentAppointments.add(
    StudentAppointment(
      id: studentAppointments.length + 1,
      date: date,
      time: time,
      doctorId: doctorId,
      studentId: studentId,
    ),
  );
}

void rescheduleStudentAppointment(
    int appointmentId, DateTime date, String time) {
  int appointmentIndex =
      studentAppointments.indexWhere((a) => a.id == appointmentId);
  studentAppointments[appointmentIndex].date = date;
  studentAppointments[appointmentIndex].time = time;
}
