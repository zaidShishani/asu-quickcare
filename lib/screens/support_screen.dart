import 'package:flutter/material.dart';

class Support_Screen extends StatefulWidget {
  const Support_Screen({super.key});

  @override
  State<Support_Screen> createState() => _SupportPageState();
}

class _SupportPageState extends State<Support_Screen> {
  final TextEditingController _textController = TextEditingController();

  void _showThanksDialog() {
    String text =
        _textController.text.trim(); 

    if (text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter a message"),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white, 
            title: Text(
              'Thank you for reaching out',
              style: TextStyle(
                  color: Color(0xff882020)), 
            ),
            content: Text(
              'We\'ll respond to you as soon as possible!',
              style: TextStyle(
                  color: Color(0xff882020)), 
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); 
                },
                child: Text(
                  'OK',
                  style: TextStyle(
                      color: Color(0xff882020)), 
                ),
              ),
            ],
          );
        },
      );
      _textController.clear(); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 64,
        toolbarHeight: 64,
        title: const Text(
          "Contanct US",
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelStyle: const TextStyle(
                  color: Color(0xff8A8B8B),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                filled: true,
                fillColor: const Color(0xFFF8F8FF),
                hintText: "Enter Your message here",
              ),
              maxLines: 5,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showThanksDialog();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff882020),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                ),
                width: double.infinity,
                child: const Center(
                  child: Text(
                    "Send Feedback",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
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
