import 'package:flutter/material.dart';

class TimeComponent extends StatelessWidget {
  const TimeComponent(
      {super.key, required this.time, required this.isSelected});
  final String time;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 175,
      decoration: BoxDecoration(
        color:
            isSelected ? const Color(0xff882020) : Colors.white, // Change color
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(2, 2),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        time,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }
}
