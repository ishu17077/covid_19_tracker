import "dart:convert";
import 'dart:io';
// import "package:connectivity/connectivity.dart";
import 'package:covid_19_tracker/district_wise_cases.dart';
import 'package:covid_19_tracker/important_functions.dart';
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:http/http.dart" as http;

import 'cases_added_yesterday.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var convertDataToJson;
  final List<MaterialAccentColor> _colors = [
    Colors.blueAccent,
    Colors.limeAccent,
    Colors.redAccent
  ];
  bool isData = true;
  File covidFile;

  @override
  void initState() {
    super.initState();
    getconvertDataToJson();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Covid-19 Tracker"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  isData = true;
                });
                getconvertDataToJson();
              })
        ],
      ),
      body: isData
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.redAccent,
              ),
            )
          : Container(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  // Map currency = convertDataToJson[index];
                  MaterialAccentColor color = _colors[index % _colors.length];
                  return Card(
                    elevation: 5.0,
                    color: Colors.white12,
                    child: ExpansionTile(
                      //  ListTile(
                      leading: InkWell(
                        child: CircleAvatar(
                          radius: 23,
                          backgroundColor: color,
                          child: Text(convertDataToJson["statewise"][index]
                              ["statecode"]),
                        ),
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    District_Cases(
                                        convertDataToJson["statewise"][index]
                                                ["statecode"]
                                            .toString()))),
                      ),
                      title: Text(
                        convertDataToJson["statewise"][index]["state"],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child:
                                    // > 0
                                    // ? Icon(
                                    //     Icons.arrow_drop_up,
                                    //     color: Colors.redAccent,
                                    //   )
                                    // :
                                    Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            TextSpan(
                                text: ("Total Confirmed Patients: " +
                                        convertDataToJson["statewise"][index]
                                            ["confirmed"])
                                    .toString(),
                                style: TextStyle(
                                  color: Colors.redAccent,
                                )),
                          ],
                        ),
                      ),
                      //  Text(
                      //   (convertDataToJson[index]["quote"]["USD"]["percent_change_24h"]).toString(),
                      //   style: TextStyle(
                      //     color: (convertDataToJson[index]["quote"]["USD"]["percent_change_24h"]) > 0? Colors.redAccent : Colors.redAccent,
                      //   ),
                      // ), //Use textSpan

                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 77,
                          ),
                          alignment: Alignment.topLeft,
                          child: Text(
                            ("Active Patients: " +
                                (convertDataToJson["statewise"][index]
                                        ["active"])
                                    .toString()),
                            style: TextStyle(
                              color:
                                  // (convertDataToJson["statewise"][index]
                                  //             ["deltadeaths"])
                                  //         0
                                  //     ? Colors.red
                                  // :
                                  Colors.redAccent,
                            ),
                            textScaleFactor: 1.12,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 77,
                          ),
                          alignment: Alignment.topLeft,
                          child: Text(
                            ("Recovered Patients: " +
                                (convertDataToJson["statewise"][index]
                                        ["recovered"])
                                    .toString()),
                            style: TextStyle(
                              color:
                                  // (convertDataToJson["statewise"][index]
                                  //             ["deltadeaths"])
                                  //         0
                                  //     ? Colors.red
                                  // :
                                  Colors.blue,
                            ),
                            textScaleFactor: 1.12,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 77,
                          ),
                          alignment: Alignment.topLeft,
                          child: Text(
                            ("Deceased Patients: " +
                                (convertDataToJson["statewise"][index]
                                        ["deaths"])
                                    .toString()),
                            style: TextStyle(
                              color:
                                  // (convertDataToJson["statewise"][index]
                                  //             ["deltadeaths"])
                                  //         0
                                  //     ? Colors.red
                                  // :
                                  Colors.blueGrey,
                            ),
                            textScaleFactor: 1.12,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 77,
                          ),
                          alignment: Alignment.topLeft,
                          child: Text(
                            ("Last Updated: " +
                                (convertDataToJson["statewise"][index]
                                        ["lastupdatedtime"])
                                    .toString()),
                            style: TextStyle(
                              color:
                                  // (convertDataToJson["statewise"][index]
                                  //             ["deltadeaths"])
                                  //         0
                                  //     ? Colors.red
                                  // :
                                  Colors.cyan,
                            ),
                            textScaleFactor: 1.12,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: convertDataToJson["statewise"] == null
                    ? 0
                    : convertDataToJson['statewise'].length - 1,
              ),
            ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Jsonpt2()));
            },
            tooltip: "Show total Increase",
            child: Icon(
              Icons.all_inclusive,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => District_Cases("RJ")));
            },
            tooltip: "Show Kota Cases",
            child: Icon(
              Icons.ac_unit,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  void getconvertDataToJson() async {
    String cryptourl = "https://data.covid19india.org/data.json";

    http.Response response;

    try {
      response = await http.get(Uri.parse(cryptourl),
          // parameters: {},
          headers: {
            "Accept": "application/json",
            // "X-CMC_PRO_API_KEY": "36eb5338-d84d-45b6-930d-2c73544d242e",
          });
      if (response.statusCode == 200) {
        convertDataToJson = json.decode(response.body);
      }

      setState(() {
        print(response.toString());
        if (response.statusCode == 200) {
          isData = false;
        }
      });
    } catch (e) {
      _showAlertBox(context);
    }
    if (response != null) {
      if (response.statusCode == 200) {
        covidFile.writeAsString(response.body); //? Writing to the file.
        debugPrint(await covidFile.readAsString());
        debugPrint(convertDataToJson["statewise"].toString());
        debugPrint("successful writing the file");
      }
    }

    // Future.delayed(Duration(seconds: 2), () {
    //   if (response.statusCode != 200) {}
    // });

    // isData = true;
  }

  void showOldData() async {
    covidFile = await ImportantFunctions().localFile;
    bool filepresent = await covidFile.exists();
    debugPrint(filepresent.toString());

    if (filepresent == false) {
      covidFile = File(await ImportantFunctions()
          .localPath); //? will create a new file everytime, we don't want that
    }
    _showAlertBox(context);
    String covidFileContents = covidFile.readAsStringSync();
    convertDataToJson = json.decode(covidFileContents);
    setState(() {
      isData = false;
    });
  }

  void _showAlertBox(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Unable to fetch data!"),
          content: Text("Please check your internet connection and try again."),
          actions: <Widget>[
            TextButton(
                onPressed: () => SystemNavigator.pop(), child: Text("OK")),
            TextButton(
                onPressed: () {
                  showOldData();
                  Navigator.pop(context);
                },
                child: Text('Show Old Data!'))
          ],
        );
      },
    );
  }
}
