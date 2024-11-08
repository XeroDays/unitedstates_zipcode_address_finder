# United States Zip Code Lookup

A Flutter package to retrieve detailed location information based on United States zip codes. This package sends a request to a cloud server to fetch the address, state name, city name, local name, area code, and state code associated with a given zip code.

This package is ideal for applications requiring accurate location information specific to U.S. zip codes.
 
## Gallery

<div style="display:flex">
<code><img height="400px" src="https://raw.githubusercontent.com/XeroDays/unitedstates_zipcode_address_finder/refs/heads/main/Images/Usa%20zipcode%20address%20lookup.png"></code> 
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

| Android | iOS | MacOS | Windows | Linux | Web |
| ------- | --- | ----- | ------- | ----- | --- |
|    ✅   |  ✅  |   `(To be tested)`  |   `(To be tested)`    |   `(To be tested)`   |  ❌ |



## Installation

Add this package to your project's `pubspec.yaml` file:

```yaml
dependencies:
  usa_zipcode_address_lookup: ^1.0.0
```

Then, run:

```sh
flutter pub get
```

## Usage

### Import the Package

```dart
import 'package:usa_zipcode_address_lookup/usa_zipcode_address_lookup.dart';
```

### Example

To retrieve location details, Create a static instance of  `USAZipCodeAddressLookup` class (or similar) and call the `searchZipcode` method with the zip code as an argument. 

Here’s an example:

```dart
ZipCodeLocation locationModel = await USAZipCodeAddressLookup.searchZipcode(randomZipCode);
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
