import 'package:flutter/material.dart';

class FAQSScreen extends StatelessWidget {
  const FAQSScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 64,
        toolbarHeight: 64,
        title: const Text(
          "Frequently Asked Questions",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "\u2022 What is considered a normal blood pressure?",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Normal blood pressure is generally around 120/80 mmHg. Anything consistently higher or lower should be discussed with a doctor.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "\u2022 How much water should I drink daily?",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "The average recommendation is 8-10 glasses (2-3 liters) per day, but this can vary based on activity level, climate, and individual needs.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "\u2022 How much exercise do I need?",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Adults should aim for at least 150 minutes of moderate aerobic activity or 75 minutes of vigorous activity weekly, plus muscle-strengthening exercises twice a week.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "\u2022 What is the difference between a cold and the flu?",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "A cold is milder, with symptoms like a runny nose and sore throat. The flu is more severe, often causing fever, body aches, and fatigue.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "\u2022 How can I maintain a healthy diet?",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Maintaining a healthy diet involves eating a variety of fruits, vegetables, whole grains, lean proteins, and healthy fats. Reducing sugar, salt, and processed food intake is also important. Staying hydrated and eating in moderation play key roles in long-term health.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "\u2022 What are common symptoms of the flu?",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Symptoms of the flu include fever, chills, coughing, a sore throat, muscle or body aches, fatigue, and sometimes vomiting or diarrhea. These symptoms are more severe and abrupt compared to a common cold.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
