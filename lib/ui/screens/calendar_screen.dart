import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_erp/controlar/calendar_provider.dart';
import 'package:school_erp/ui/widgets/appbar_widget.dart';
import 'package:table_calendar/table_calendar.dart';

class CalanderScreen extends StatefulWidget {
  const CalanderScreen({super.key});

  @override
  State<CalanderScreen> createState() => _CalanderScreenState();
}

class _CalanderScreenState extends State<CalanderScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CalendarProvider>().getCalendardata(context: context);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  final Map<DateTime, List<String>> _events = {
    DateTime.utc(2026, 3, 6): ["PTM Meeting", "SportDay"],

    DateTime.utc(2026, 3, 3): ["Holiday", "holi"],
    DateTime.utc(2025, 3, 2): ["Holiday"],
    DateTime.utc(2026, 3, 3): ["Holiday", "weekly off"],
    DateTime.utc(2026, 3, 19): ["Holiday"],
  };
  List<String> _getEventsForDay(DateTime day) {
    return _events.entries
        .where((e) => isSameDay(e.key, day))
        .expand((e) => e.value)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final selectedEvents = _getEventsForDay(_selectedDay ?? DateTime.now());
    return Scaffold(
      appBar: AppbarWidget(titleText: "Calendar"),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Color(0xFF20AE29),
                    ),
                    Text("Today Date"),
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Color.fromARGB(255, 44, 134, 252),
                    ),
                    Text("Selected Date"),
                  ],
                ),
                TableCalendar(
                  focusedDay: _focusedDay,
                  firstDay: DateTime.now(),
                  lastDay: DateTime(2030),
                  headerStyle: HeaderStyle(
                    titleCentered: true,
                    titleTextStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    formatButtonVisible: false,
                  ),
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  eventLoader: _getEventsForDay,

                  calendarStyle: CalendarStyle(
                    selectedDecoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    todayDecoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Event Detail",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                selectedEvents.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(
                          //  physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: [
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color(0xFFA5D2AB),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  SizedBox(width: 20),
                                  Icon(
                                    Icons.sunny,
                                    color: Color(0xFF1F972F),
                                    size: 25,
                                  ),
                                  SizedBox(width: 20),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Summer Vacations"),
                                        Text(
                                          "May 15 to June 15",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF717374),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color(0xFF94BDD7),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  SizedBox(width: 20),
                                  Icon(
                                    Icons.coronavirus_sharp,
                                    color: Color(0xFF1985C9),
                                    size: 25,
                                  ),
                                  SizedBox(width: 20),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Winter Vacations"),
                                        Text(
                                          "Janaury 10 to Febury 10",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF717374),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,

                        itemCount: selectedEvents.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 162, 205, 225),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 20),
                                  Text(
                                    selectedEvents[index],
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFF899AEE),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
