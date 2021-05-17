import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text(
          "Calendar",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              print("setting icon is clicked");
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              initialCalendarFormat: CalendarFormat.month,
              calendarStyle: CalendarStyle(
                todayColor: Colors.blue,
                selectedColor: Theme.of(context).primaryColor,
                //// Today Style
                todayStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                  color: Colors.white,
                ),
                //// OutSide Style
                outsideStyle: TextStyle(
                  color: Colors.grey,
                ),
                //// OutSide-Weekends Style
                outsideWeekendStyle: TextStyle(
                  color: Colors.red[200],
                ),
                //// Weekdays Style
                weekdayStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
              headerStyle: HeaderStyle(
                centerHeaderTitle: true,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                ),
                //// left button style
                leftChevronIcon: Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                ),
                //// right button style
                rightChevronIcon: Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ),
                formatButtonDecoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(22.0),
                ),
                formatButtonTextStyle: TextStyle(
                  color: Colors.white,
                ),
                formatButtonShowsNext: false,
              ),
              builders: CalendarBuilders(
                selectedDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(5.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
                todayDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(5.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              calendarController: _controller,
            ),

            //// Snack Bar
            Builder(builder: (BuildContext context2) {
              return Container(
                child: Align(
                  alignment: Alignment(0.70, 0.50),
                  child: RaisedButton(
                    child: Text("Reward"),
                    onPressed: () {
                      Scaffold.of(context2).showSnackBar(SnackBar(
                        content: Text(
                          "도장을 찍어주세요.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        backgroundColor: Colors.grey[600],
                        duration: Duration(milliseconds: 2000),
                      ));
                    },
                  ),
                ),
              );
            }),
          ],
        ),
      ),
      drawer: Container(
        width: 250,
        child: Drawer(
          child: Container(
            color: Colors.grey[700],
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    // temporary User Image -> Ignore
                    //backgroundImage: AssetImage("assets/licking-cat.png"),
                    backgroundColor: Colors.grey[850],
                  ),
                  otherAccountsPictures: <Widget>[
                    CircleAvatar(
                      // temporary User Image -> Ignore
                      //backgroundImage: AssetImage("assets\\cat-second.png"),
                      backgroundColor: Colors.grey[850],
                    ),
                  ],
                  //////text - name
                  accountName: Text(
                    "Time Timer Setting",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //////text - email
                  accountEmail: Text(
                    "",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  ////// list arrow
                  onDetailsPressed: () {
                    print("arrow is clicked");
                  },
                  ////// Drawer head design
                  decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40.0),
                        bottomRight: Radius.circular(40.0),
                      )),
                ),
                ///////Drawer Head list
                ListTile(
                  leading: Icon(
                    Icons.timer,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Timer",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    print("Timer is clicked");
                  },
                  //trailing: Icon(Icons.add),
                ),

                ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  title: Text(
                    "setting",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    print("setting is clicked");
                  },
                  //trailing: Icon(Icons.add),
                ),

                ListTile(
                  leading: Icon(
                    Icons.question_answer,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Q&A",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    print("Q&A is clicked");
                  },
                  //trailing: Icon(Icons.add),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}