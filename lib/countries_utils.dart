/// A lite dart package for providing offline World Countires Data with helpful utils to 
/// to your dart or flutter application 
/// 
/// the package introduces [Country] , [Currency] , [TimeZone] models to your app 
/// for easy handeling of the country data and time minpulations
///*  examples:
/// 
///  get all countries data : Countries.all();
///
///  get country by name : Countries.byName('Egypt');
///
///  get country all  Native name translations : Countries.byName('Egypt').nativeName);
///
///  get country Native name translations : Countries.byName('Egypt').nativeName);
///
///  get country all  name translations : Countries.byName('Egypt').translations);
///
///  get country all  name altSpellings : Countries.byName('Egypt').altSpellings);
///
///  get country all  name demonym : Countries.byName('Egypt').demonym);
///
///  get country all currnecies : Countries.byName('Egypt').currnecies);
///
///  get country name translated to one language  : Countries.byName('Egypt').translate('ar');
///
///  get country by timeZone  : 
///     Countries.byTimeZone(
///       TimeZone(offset: Duration(hours: 02, minutes: 00), offsetType: '+'))
///     .countries.length);
///
///  get country by alpha2Code : Countries.byCode('EG');
///
///  get country by alpha3Code : Countries.byAlpha3Code('EGY');
///
///  get country by byNumericCode : Countries.byNumericCode('818');
/// 
library countries_utils;

import 'package:countries_utils/models/country.dart';
import 'package:countries_utils/models/currency.dart';
import 'package:countries_utils/models/timezone.dart';

export 'models/country.dart';
export 'models/country_list.dart';
export 'models/currency.dart';
export 'models/currency_list.dart';
export 'models/country.dart';
export 'countries.dart';
