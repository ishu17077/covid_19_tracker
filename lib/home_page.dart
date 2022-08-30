import "dart:convert";
import 'dart:io';
// import "package:connectivity/connectivity.dart";
import 'package:covid_19_tracker/district_wise_cases.dart';
import 'package:covid_19_tracker/important_functions.dart';
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:http/http.dart" as http;
import 'package:page_transition/page_transition.dart';

import 'cases_added_yesterday.dart';

class HomePage extends StatefulWidget {
  static String cryptourlHomePage = 'https://data.covid19india.org/data.json';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var convertDataToJson;
  bool isOldData = false;
  final List<MaterialAccentColor> _colors = [
    Colors.blueAccent,
    Colors.limeAccent,
    Colors.redAccent
  ];
  bool isDialogueBoxShown = false;
  bool isData = true;
  File? covidFile;

  @override
  void initState() {
    super.initState();
    getconvertDataToJson();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          MediaQuery.of(context).platformBrightness == Brightness.light
              ? Colors.white
              : Colors.black,
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
      body: Stack(
        children: [
          isData
              ? Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.redAccent,
                  ),
                )
              : Container(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      // Map currency = convertDataToJson[index];
                      MaterialAccentColor color =
                          _colors[index % _colors.length];
                      return Card(
                        elevation: 5.0,
                        color: MediaQuery.of(context).platformBrightness ==
                                Brightness.dark
                            ? Colors.white12
                            : Colors.white,
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
                                    builder: (context) => DistrictCases(
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2.0),
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
                                            convertDataToJson["statewise"]
                                                [index]["confirmed"])
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
          isOldData
              ? Align(
                  alignment: Alignment.topRight,
                  child: Material(
                    elevation: 5.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 1),
                      child: Text(
                        "Old Data",
                        style: TextStyle(
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ),
                )
              : SizedBox(height: 0, width: 0),
        ],
      ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'btn1',
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                    child: CasesAddedYesterday(),
                    type: PageTransitionType.leftToRight),
              );
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
            heroTag: 'btn2',
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: DistrictCases("RJ"),
                      type: PageTransitionType.rightToLeft));
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
    String cryptourl = HomePage.cryptourlHomePage;
    var importantFunctions = ImportantFunctions();
    covidFile = await importantFunctions.localFile('covid_cases.json');
    bool filepresent = await covidFile?.exists() ?? false;
    debugPrint(filepresent.toString());

    if (filepresent == false) {
      covidFile = File(await importantFunctions.localPath(
          'covid_cases.json')); //? will create a new file everytime, we don't want that
    }
    http.Response? response;

    try {
      response = await http.get(Uri.parse(cryptourl),
          // parameters: {},
          headers: {
            "Accept": "application/json",
          });
      if (response.statusCode == 200) {
        convertDataToJson = json.decode(response.body);
      }

      setState(() {
        print(response.toString());
        if (response?.statusCode == 200) {
          isOldData = false;
          isData = false;
        }
      });
    } catch (e) {
      _showAlertBox(context);
    }
    if (response != null) {
      if (response.statusCode == 200) {
        covidFile?.writeAsString(response.body); //? Writing to the file.
        //! debugPrint(await covidFile?.readAsString().toString().substring(0, 200));
        debugPrint(convertDataToJson["statewise"].toString().substring(0, 200) +
            '...');
        debugPrint("successful writing the file");
      }
    }

    // Future.delayed(Duration(seconds: 2), () {
    //   if (response.statusCode != 200) {}
    // });

    // isData = true;
  }

  void _showOldData() async {
    String covidFileContents = covidFile?.readAsStringSync() ?? '';
    convertDataToJson = json.decode(covidFileContents);
    setState(() {
      isOldData = true;
      isData = false;
    });
  }

  void _showAlertBox(context) async {
    bool? result = isDialogueBoxShown
        ? null
        : await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Unable to fetch data!"),
                content: Text(
                    "Please check your internet connection andj try again."),
                actions: <Widget>[
                  TextButton(
                      onPressed: () => SystemNavigator.pop(),
                      child: Text("OK")),
                  TextButton(
                      onPressed: () {
                        _showOldData();
                        Navigator.pop(context);
                      },
                      child: Text('Show Old Data!'))
                ],
              );
            },
          );
    isDialogueBoxShown = true;
    if (result == false || result == null) {
      _showOldData();
    }
  }
}
