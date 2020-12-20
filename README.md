#  flutter_country

![enter image description here](https://img.shields.io/github/issues/egyleader/flutter_country) ![enter image description here](https://img.shields.io/github/forks/egyleader/flutter_country) ![enter image description here](https://img.shields.io/github/stars/egyleader/flutter_country) ![enter image description here](https://img.shields.io/twitter/url?url=https://github.com/egyleader/flutter_country)



A lite flutter package for providing World Country Data without internet connection



##  Installation

depend on the package in your pubspec.yaml :

```yaml
 dependencies:

flutter_country: ^0.0.3
```

get the packages :

```yaml
flutter pub get


```



##  parameters

This is a list of the properties that can be provided for each country

|           **Parameter**           |     Return Type      |                 Output Example                  |
| :-------------------------------: | :------------------: | :---------------------------------------------: |
|               name                |        String        |                      Egypt                      |
|           officialName            |        String        |             Arab Republic of Egypt              |
|            nativeName             |   TranslationList    |               جمهورية مصر العربية               |
|           translations            |   TranslationList    | TranslationList(translations:List<Translation>) |
|             demonyms              |     DemonymList      | TranslationList(translations:List<Translation>) |
|           altSpellings            |     List<String>     |       [ "EG" , "Arab Republic of Egypt" ]       |
|            alpha2Code             |        String        |                       EG                        |
|            alpha3Code             |        String        |                       EGY                       |
|            numericCode            |        String        |                       818                       |
|            olympicCode            |        String        |                       EGY                       |
|            independent            |         bool         |                      true                       |
|             unMember              |         bool         |                      true                       |
|            landLocked             |         bool         |                                                 |
|          topLevelDomain           |     List<String>     |                       .eg                       |
|              capital              |        String        |                      Cairo                      |
|              region               |        String        |                     Africa                      |
|             subRegion             |        String        |                 Northern Africa                 |
|            currnecies             |     CurrencyList     |    CurrencyList(currencies:List<Currency>);     |
|             languages             | Map<String, dynamic> |    { 'eng' : 'English' , 'ara' : 'Arabic ' }    |
|              borders              |     List<String>     |               ["LBY","PSE","SDN"]               |
|           area [in km]            |        double        |                     1002450                     |
|               flag                |        String        |                       🇪🇬                        |
|             phoneCode             |     List<String>     |                       +20                       |
| coordinates [latitiude,longitude] |     List<double>     |                     [27,30]                     |
|             latitiude             |        double        |                       27                        |
|             longitude             |        double        |                       30                        |



##  Metods

This is a list of the methods you can get country data by :

|      Method       |  Return Type  |              Description              |                 Example                  |
| :---------------: | :-----------: | :-----------------------------------: | :--------------------------------------: |
|       all()       | List<Country> |        get all countries data         |             Countries.all()              |
|     byName()      |    Country    |          get country by name          |        Countries.byName('Egypt')         |
|     byCode()      |    Country    |      get country by alpha2 code       |          Countries.byCode('EG')          |
|   byAlph3Code()   |    Country    |      get country by alpha3 code       |      Countries.byAlpha3Code('EGY')       |
|  byNumericCode()  |    Country    |      get country by numeric code      |      Countries.byNumericCode('818')      |
|  byOlympicCode()  |    Country    |     get country by  olympic code      |                                          |
|   byPhoneCode()   |    Country    |       get country by phone code       |       Countries.byPhoneCode('+20')       |
|    byCapital()    |    Country    |        get country by capital         |       Countries.byCapital('Cairo')       |
|     byFlag()      |    Country    |       get country by flag emoji       |          Countries.byFlag('🇪🇬')          |
| byLanguageCode()  | List<Country> |     get country by language code      |     Countries.byLanguageCode('ara')      |
| byLanguageName()  | List<Country> |     get country by language name      |    Countries.byLanguageName('Arabic')    |
|    unMembers()    | List<Country> |       get UN Members countries        |          Countries.unMembers()           |
|   independent()   | List<Country> |     get all independent countries     |         Countries.independent()          |
|    byRegion()     | List<Country> |        get countries by region        |       Countries.byRegion('Africa')       |
|   bySubRegion()   | List<Country> |      get countries by sub region      | Countries.bySubRegion('Southern Europe') |
|     byArea()      |    Country    |         get countries by area         |        Countries.byArea(1002450)         |
| areaBiggerThan()  | List<Country> | get countries Bigger than given area  |    Countries.areaBiggerThan(1002450)     |
| areaSmallerThan() | List<Country> | get countries Smaller than given area |    Countries.areaSmallerThan(1002450)    |



## Development

Want to contribute? Great 😄 .. all good contributions to this package are welcome



## Credit

thanks for [mledoze/countries](https://github.com/mledoze/countries) for the json country data 