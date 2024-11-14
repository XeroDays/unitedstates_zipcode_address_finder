import 'dart:math';
import 'package:flutter/material.dart';
import 'package:usa_zipcode_address_lookup/usa_zipcode_address_lookup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'United States Zip Code Address Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.system,
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home();

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //list of tempororray zipcodes
  List<String> zipcodes = [
    "66541",
    "54433",
    "00601" ,
    "66543",
    "72122",
    "55424",
    "62345"
  ];

  String randomZipCode = "";
  String zipcodeInformation = "[No Information (Click to refresh)]";
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: const Text("United States ZipCode Address")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: size.width,
              child: const Text(
                "Search for any US Zipcode",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22),
              )),
          SizedBox(
              width: size.width,
              child: const Text(
                "UnitedStates ZipCode Address Finder",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10),
              )),
          const SizedBox(height: 20),
          isLoading
              ? const CircularProgressIndicator()
              : Column(
                  children: [
                    const SizedBox(height: 3),
                    Text(
                      randomZipCode.toString(),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Zipcode Information",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      zipcodeInformation,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });

                //select random zipcode from the list
                Random random = Random();
                randomZipCode = zipcodes[random.nextInt(zipcodes.length)];

                ZipCodeLocation objec =
                    await USAZipCodeAddressLookup.searchZipcode(randomZipCode);
                updateScreen(objec);
              },
              //set font size to be 20
              style: ButtonStyle(
                foregroundColor:
                    WidgetStateProperty.all(Color.fromARGB(255, 12, 115, 199)),
                padding: WidgetStateProperty.all(const EdgeInsets.all(13)),
                textStyle: WidgetStateProperty.all(
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              child: const Text("Search Zipcode Address")),
        ],
      ),
    );
  }

  void updateScreen(ZipCodeLocation objec) {
    setState(() {
      zipcodeInformation = "";
      zipcodeInformation += "ZipCode : ${objec.zipCode}\n";
      zipcodeInformation += "City : ${objec.city}\n";
      zipcodeInformation += "State Code : ${objec.stateCode}\n";
      zipcodeInformation += "State Name : ${objec.stateName}\n";
      zipcodeInformation += "Local Name : ${objec.localName}\n";
      zipcodeInformation += "Address : ${objec.address}\n";
      zipcodeInformation += "Area Code : ${objec.areaCode}\n";

      isLoading = false;
    });
  }
}
