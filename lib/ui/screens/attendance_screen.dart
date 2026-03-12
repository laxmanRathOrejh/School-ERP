
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AttendanceCalendar extends StatefulWidget {
  const AttendanceCalendar({super.key});

  @override
  State<AttendanceCalendar> createState() => _AttendanceCalendarState();
}

class _AttendanceCalendarState extends State<AttendanceCalendar> {
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;

  Map<DateTime, String> attendance = {
    DateTime(2026, 3, 2): "absent",
    DateTime(2026, 2, 9): "absent",
    DateTime(2026, 2, 21): "absent",
    DateTime(2026, 2, 12): "absent",

    DateTime(2026, 3, 2): "absent",
  };

  Color? getColor(DateTime day) {
    final status = attendance[DateTime(day.year, day.month, day.day)];

    if (status == "absent") {
      return Colors.red;
    } else {
      return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Attendance")),
      body: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(radius: 10, backgroundColor: Color(0xFF20AE29)),
              Text("Absentt"),
              CircleAvatar(radius: 10, backgroundColor: Colors.red),
              Text("Present"),
            ],
          ),
          TableCalendar(
            firstDay: DateTime(2025),
            lastDay: focusedDay,
            focusedDay: focusedDay,

            selectedDayPredicate: (day) {
              return isSameDay(selectedDay, day);
            },
            headerStyle: HeaderStyle(
              titleCentered: true,
              titleTextStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              formatButtonVisible: false,
            ),

            onDaySelected: (selected, focused) {
              setState(() {
                selectedDay = selected;
                focusedDay = focused;
              });
            },

            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) {
                Color? color = getColor(day);

                return Container(
                  margin: const EdgeInsets.all(6),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '${day.day}',
                    style: const TextStyle(color: Colors.white),
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
