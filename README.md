# United States Zip Code Lookup

A Flutter package to retrieve detailed location information based on United States zip codes. This package sends a request to a cloud server to fetch the address, state name, city name, local name, area code, and state code associated with a given zip code.

This package is ideal for applications requiring accurate location information specific to U.S. zip codes.
 
## Gallery

<div style="display:flex">
<code><img height="400px" src="https://github-production-user-asset-6210df.s3.amazonaws.com/38852291/384482117-32225425-0f9c-4520-b21e-9f4e8b995d39.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVCODYLSA53PQK4ZA%2F20241108%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20241108T182603Z&X-Amz-Expires=300&X-Amz-Signature=87e280e4e033be8b008f1cbccb5a7e8deff1488961afa042b203dcb083f9d192&X-Amz-SignedHeaders=host"></code> 
</div>

## Features

- Fetches location details based on U.S. zip codes
- Returns:
  - **Address**
  - **State name**
  - **City name**
  - **Local name**
  - **Area code**
  - **State code**

## Supported Devices

- **Android**: ✅
- **iOS**: ✅
- **Web**: ❌
- **MacOS**:  `(To be tested)`
- **Windows**:  `(To be tested)`
- **Linux**:  `(To be tested)`

## Installation

Add this package to your project's `pubspec.yaml` file:

```yaml
dependencies:
  usa_zipcode_address_finder: ^1.0.0
```

Then, run:

```sh
flutter pub get
```

## Usage

### Import the Package

```dart
import 'package:usa_zipcode_address_finder/usa_zipcode_address.dart';
```

### Example

To retrieve location details, Create a static instance of  `USAZipCodeAddressFinder` class (or similar) and call the `searchZipcode` method with the zip code as an argument. 

Here’s an example:

```dart
ZipCodeLocation locationModel = await USAZipCodeAddressFinder.searchZipcode(randomZipCode);
```

### Sample Output

Given a zip code, the output would include information like:

```plaintext
Address: 320 MAIN ST
State Name: Kansas
City Name: SUMMERFIELD
Local Name: SUMMERFIELD
Area Code: 4J
State Code: KS
```


## License

[MIT License](LICENSE)

## Contributions

Contributions are welcome! Feel free to submit a pull request or report issues.
