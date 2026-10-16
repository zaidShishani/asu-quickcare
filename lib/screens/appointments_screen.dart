import 'package:flutter/material.dart';
import 'package:asu_quickcare/widgets/upcoming_appointments.dart';
import 'package:asu_quickcare/widgets/pastAppointments.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leadingWidth: 64,
          toolbarHeight: 64,
          title: const Text(
            "My Appointments",
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
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(76),
            child: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9999),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(24, 0, 0, 0),
                  ),
                  BoxShadow(
                    offset: Offset(0, 4),
                    color: Colors.white,
                    blurRadius: 24.0,
                  ),
                ],
              ),
              child: TabBar(
                indicator: BoxDecoration(
                  color: const Color.fromRGBO(136, 32, 32, 1),
                  borderRadius: BorderRadius.circular(9999),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                dividerColor: Colors.transparent,
                tabs: const [
                  Tab(
                    child: Text(
                      "Upcoming",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Past",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            UpcomingAppointments(),
            PastAppointments(),
          ],
        ),
      ),
    );
  }
}
