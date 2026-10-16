import 'package:flutter/material.dart';

class DateComponent extends StatelessWidget {
  const DateComponent({
    super.key,
    required this.day,
    required this.date,
    required this.isSelected,
    required this.isEnable,
  });
  final String day;
  final String date;
  final bool isSelected;
  final bool isEnable;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: isEnable
            ? const Color(0xffdddddd)
            : isSelected
                ? const Color(0xff882020)
                : Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: TextStyle(
              color: isEnable
                  ? const Color(0xff8A8B8B)
                  : isSelected
                      ? Colors.white
                      : Colors.black,
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            date,
            style: TextStyle(
              color: isEnable
                  ? const Color(0xff8A8B8B)
                  : isSelected
                      ? Colors.white
                      : Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
