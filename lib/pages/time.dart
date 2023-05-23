import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;

class TimePage extends StatefulWidget {
  @override
  _TimePageState createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  String selectedLocation = 'WIB';

  String getTimeByLocation(String location) {
    DateTime now = DateTime.now();
    String time = DateFormat('HH:mm:ss').format(now); // Menambahkan format detik

    switch (location) {
      case 'WIB':
        return time;
      case 'WIT':
        return DateFormat('HH:mm:ss').format(now.add(Duration(hours: 1)));
      case 'WITA':
        return DateFormat('HH:mm:ss').format(now.add(Duration(hours: 2)));
      case 'London':
        var london = tz.getLocation('Europe/London');
        var londonTime = tz.TZDateTime.from(now, london);
        return DateFormat('HH:mm:ss').format(londonTime);
      default:
        return time;
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    String formattedDate = DateFormat('MMMM dd, yyyy').format(currentDate);

    return Scaffold(
      appBar: AppBar(
        title: Text('Time Converter'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current Time:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            StreamBuilder(
              stream: Stream.periodic(Duration(seconds: 1)), // Stream untuk memperbarui waktu setiap detik
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return Text(
                  getTimeByLocation(selectedLocation),
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                );
              },
            ),
            SizedBox(height: 10),
            Text(
              'Current Date:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              formattedDate,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Select Location'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: Text('WIB'),
                            onTap: () {
                              setState(() {
                                selectedLocation = 'WIB';
                              });
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            title: Text('WIT'),
                            onTap: () {
                              setState(() {
                                selectedLocation = 'WIT';
                              });
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            title: Text('WITA'),
                            onTap: () {
                              setState(() {
                                selectedLocation = 'WITA';
                              });
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            title: Text('London'),
                            onTap: () {
                              setState(() {
                                selectedLocation = 'London';
                              });
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Text('Change Location'),
              style: ElevatedButton.styleFrom(
                primary: Colors.teal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
