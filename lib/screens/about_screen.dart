import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 64,
        toolbarHeight: 64,
        title: const Text(
          "About",
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
      body: ListView(
        children: [
          Container(
            height: 100,
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
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
            child: ListTile(
              leading: Icon(
                Icons.article,
                size: 40,
                color: Color(0xff882020),
              ),
              title: Text(
                "FAQS",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, "/faqsScreen");
              },
            ),
          ),
          Container(
            height: 100,
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
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
            child: ListTile(
              leading: Icon(
                Icons.medical_services_rounded,
                size: 40,
                color: Color(0xff882020),
              ),
              title: Text(
                "Clinic Information",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, "/clinicInformationScreen");
              },
            ),
          ),
          Container(
            height: 100,
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
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
            child: ListTile(
              leading: Icon(
                Icons.support_agent_sharp,
                size: 40,
                color: Color(0xff882020),
              ),
              title: Text(
                "Technical Support",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, "/supportScreen");
              },
            ),
          ),
        ],
      ),
    );
  }
}
