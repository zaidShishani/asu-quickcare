import 'package:asu_quickcare/models/doctor.dart';
import 'package:asu_quickcare/screens/doctor_details_screen.dart';
import 'package:flutter/material.dart';

class DoctorsListScreen extends StatefulWidget {
  const DoctorsListScreen({super.key});

  @override
  State<DoctorsListScreen> createState() => _DoctorsListScreenState();
}

class _DoctorsListScreenState extends State<DoctorsListScreen> {
  final ScrollController _scrollController = ScrollController();

  void scrollToIndex(int index) {
    _scrollController.animateTo(
      index * 120.0, // Calculate the exact offset based on item height
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  List<Doctor> _foundDoctors = [];
  @override
  void initState() {
    _foundDoctors = doctors;
    super.initState();
  }

  void _runfilter(String enteredKeyword) {
    List<Doctor> results = [];
    if (enteredKeyword.isEmpty) {
      results = doctors;
    } else {
      results = doctors
          .where((doctor) => doctor.specialty
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundDoctors = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 64,
        toolbarHeight: 64,
        title: const Text(
          "Doctors",
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
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              onChanged: (value) => _runfilter(value),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0xff0b2e35),
                  size: 20,
                ),
                prefixIconConstraints: BoxConstraints(
                  maxHeight: 20,
                  minWidth: 25,
                ),
                border: InputBorder.none,
                hintText: "Search",
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _foundDoctors.length,
              itemBuilder: (context, index) {
                final doctor = _foundDoctors[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DoctorDetailsScreen(doctor: doctor)));
                  },
                  child: Container(
                    height: 100,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(doctor.imageURL),
                            ),
                            const SizedBox(width: 16.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    doctor.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  const SizedBox(height: 4.0),
                                  Text(
                                    doctor.specialty,
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // Positioned(
                        //   bottom: 0,
                        //   right: 0,
                        //   child: Container(
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 8.0, vertical: 4.0),
                        //     child: Row(
                        //       mainAxisSize: MainAxisSize.min,
                        //       children: [
                        //         const Icon(Icons.star, color: Colors.amber),
                        //         const SizedBox(width: 4.0),
                        //         Text(
                        //           doctor['rating'].toString(),
                        //           style: const TextStyle(
                        //             fontWeight: FontWeight.bold,
                        //             fontSize: 11.7,
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
