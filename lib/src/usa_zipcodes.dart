import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class USAZipCodeAddressLookup {
  static const String _baseUrl = 'https://api.softasium.com/api/ZipApi?hash=';

  /// Search ZipCode on United states and get the location details of the zipcode
  /// [zipCode] is the zipcode of the location
  /// [timeOutSeconds] is the time out for the request
  /// return [ZipCodeLocation] object
  static Future<ZipCodeLocation> searchZipcode(String zipCode,
      {int? timeOutSeconds}) async {
    HttpOverrides.global = MyHttpOverrides();
    final uri = Uri.parse('$_baseUrl$zipCode');
    final headers = {
      "Authorization": "iamsyedidrees",
      "Accept": "*/*",
    };

    try {
      //if timeout is not null then add timeout else without timeout post request
      http.Response response = timeOutSeconds != null
          ? await http
              .post(
              uri,
              headers: headers,
            )
              .timeout(
              Duration(seconds: timeOutSeconds),
              onTimeout: () {
                return http.Response("", 300);
              },
            )
          : await http.post(
              uri,
              headers: headers,
            );

      int statusCode = response.statusCode;
      String responseBody = response.body;
      print(responseBody);
      if (statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(responseBody.toString());
        return ZipCodeLocation.fromSnapshot(data);
      } else if (statusCode == 300) {
        return ZipCodeLocation(
            message: "No Internet connected, or Weak Internet : $statusCode",
            status: false,
            zipCode: zipCode,
            stateCode: "",
            stateName: "",
            city: "",
            localName: "",
            address: "",
            areaCode: "");
      } else {
        return ZipCodeLocation(
            message: "Not Authorized. Return with Reponse code : $statusCode",
            status: false,
            zipCode: zipCode,
            stateCode: "",
            stateName: "",
            city: "",
            localName: "",
            address: "",
            areaCode: "");
      }
    } catch (e) {
      return ZipCodeLocation(
          message:
              "Error  :  Failed hitting api, Unable to connect to the server. or Server not available/active. Please Try again later!",
          status: false,
          zipCode: zipCode,
          stateCode: "",
          stateName: "",
          city: "",
          localName: "",
          address: "",
          areaCode: "");
    }
  }
}

class ZipCodeLocation {
  late String zipCode;
  late String stateCode;
  late String stateName;
  late String city;
  late String localName;
  late String address;
  late String areaCode;
  String? message;
  bool? status;

  ZipCodeLocation({
    required this.zipCode,
    required this.stateCode,
    required this.stateName,
    required this.city,
    required this.localName,
    required this.address,
    required this.areaCode,
    this.message,
    this.status,
  });

  ZipCodeLocation.fromSnapshot(Map<String, dynamic> map) {
    zipCode = map['zip_code'];
    stateCode = map['state_abbr']??"";
    stateName = map['state_name']??"";
    city = map['city']??"";
    localName = map['local_name']??"";
    address = map['address']??"";
    areaCode = map['area_code']??"";
    message = map['message'];
    status = map['status'];
  }
}
