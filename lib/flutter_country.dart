library flutter_country;

import 'package:flutter/cupertino.dart';
import 'package:flutter_country/models/country.dart';
import 'package:flutter_country/services/country_service.dart';

class Countries {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  Countries._();

  static Future<List<Country>> all() async {
    WidgetsFlutterBinding.ensureInitialized();
    var countries = loadCountries();
  }
}
