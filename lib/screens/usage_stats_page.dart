import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:app_usage/app_usage.dart';
import 'package:monitor_app/constants.dart';
import 'package:monitor_app/widgets/activity_card.dart';

class ShowStats extends StatefulWidget {
  @override
  _ShowStatsState createState() => _ShowStatsState();
}

class _ShowStatsState extends State<ShowStats> {
  List<AppUsageInfo> _infos = [];

  //Add the apps you want to monitor over here.
  List<String> monitoredApps = ["chrome", "monitor_app", "messaging"];

  @override
  void initState() {
    getUsageStats();
    super.initState();
  }

  void getUsageStats() async {
    try {
      DateTime endDate = new DateTime.now();
      DateTime startDate = endDate.subtract(Duration(hours: 1));
      List<AppUsageInfo> infoList =
          await AppUsage.getAppUsage(startDate, endDate);
      setState(() {
        _infos = infoList;
      });

      for (var info in infoList) {
        print(info.toString());
      }
    } on AppUsageException catch (exception) {
      print(exception);
    }
  }

  String getDuration(String duration) {
    List<String> time = duration.split(':');
    String hours = time[0] + " h ";
    String minutes = time[1] + " m ";
    String seconds = time[2].substring(0, 2) + " s ";
    return hours + minutes + seconds;
  }

  String getSubtitleMessage(String duration) {
    int hours = int.parse(duration.split('h')[0].trim());
    if (hours <= 0) {
      return "Normal Usage";
    } else if (hours <= 1) {
      return "Acceptable Usage";
    } else if (hours <= 2) {
      return "Unacceptable Usage";
    } else {
      return "Addictive Usage";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlueLightColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('App Usage Example'),
        backgroundColor: kTextColor,
      ),
      body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: _infos.length,
          itemBuilder: (context, index) {
            if (monitoredApps.contains(_infos[index].appName)) {
              var appName =
                  _infos[index].appName.substring(0, 1).toUpperCase() +
                      _infos[index].appName.substring(1);
              var usageTime = getDuration(_infos[index].usage.toString());
              var subtitleMessage = getSubtitleMessage(usageTime);
              return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 5.0),
                  child: Card(
                    color: kBlueColor,
                    child: ListTile(
                      leading: FlutterLogo(size: 56.0),
                      title: Text(
                        appName,
                        style: kTitleTextStyle,
                      ),
                      subtitle: Text(
                        subtitleMessage,
                        style: kSubtitleTextStyle,
                      ),
                      trailing: Text(
                        usageTime,
                        style: kTimeTextStyle,
                      ),
                    ),
                  ));
            } else {
              return SizedBox(
                width: 0,
                height: 0,
              );
            }
          }),
      // floatingActionButton: FloatingActionButton(
      //     onPressed: getUsageStats, child: Icon(Icons.file_download)),
    );
  }
}
