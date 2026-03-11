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

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<CalendarProvider>(context, listen: false);
    final selectedEvents = data.getEventsForDay(_selectedDay ?? DateTime.now());
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
                    CircleAvatar(radius: 8, backgroundColor: Color(0xFF20AE29)),
                    Text("Today Date", style: TextStyle(fontSize: 12)),
                    CircleAvatar(radius: 8, backgroundColor: Color(0xFF2C86FC)),
                    Text("Selected Date", style: TextStyle(fontSize: 12)),
                  ],
                ),
                Consumer<CalendarProvider>(
                  builder: (context, value, child) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TableCalendar(
                        focusedDay: _focusedDay,
                        firstDay: DateTime.now(),
                        lastDay: DateTime(2030),
                        headerStyle: HeaderStyle(
                          titleCentered: true,
                          titleTextStyle: TextStyle(
                            fontSize: 14,
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
                        eventLoader: data.getEventsForDay,

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
                    );
                  },
                ),
                SizedBox(height: 10),

                selectedEvents.isEmpty
                    ? SizedBox()
                    : Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Event Detail",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            ListView.builder(
                              shrinkWrap: true,

                              itemCount: selectedEvents.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ListView(
                                      //  physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      children: [
                                        Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color:
                                                selectedEvents[index]["type"] ==
                                                    "exam"
                                                ? Color(0xFFA5D2AB)
                                                : Color(0xFF94BDD7),
                                            // color: Color(0xFFA5D2AB),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          child: Row(
                                            textBaseline:
                                                TextBaseline.alphabetic,
                                            children: [
                                              SizedBox(width: 20),
                                              Icon(
                                                Icons.sunny,
                                                color:
                                                    selectedEvents[index]["type"] ==
                                                        "exam"
                                                    ? Color(0xFF1F972F)
                                                    : Color(0xFF1985C9),
                                                size: 25,
                                              ),
                                              SizedBox(width: 20),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 5,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      selectedEvents[index]["eventTitle"],
                                                    ),
                                                    Text(
                                                      selectedEvents[index]["sub_title"],
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Color(
                                                          0xFF717374,
                                                        ),
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
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//                                    selectedEvents[index]["eventTitle"],
//                                    selectedEvents[index]["sub_title"],
//                                    selectedEvents[index]["event_description"],
