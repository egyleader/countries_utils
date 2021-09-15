#  countries_utils

![enter image description here](https://img.shields.io/github/issues/egyleader/countries) ![enter image description here](https://img.shields.io/github/forks/egyleader/countries) ![enter image description here](https://img.shields.io/github/stars/egyleader/countries) ![enter image description here](https://img.shields.io/twitter/url?url=https://github.com/egyleader/countries)


countries is A lite dart  package for providing World Country Data without internet connection to your dart or flutter application 


[note] : this packege it migrated from the old ~~*flutter_countries*~~ name to **countries_utils** to make it suitable for all dart projects with no flutter dependecy.

##  Installation

depend on the package in your pubspec.yaml

get the packages :

```yaml
flutter pub get
```



##  Parameters

This is a list of the properties that can be provided for each country

| **Parameter**  |     Return Type      |                        Output Example                        |
| :------------: | :------------------: | :----------------------------------------------------------: |
|      name      |        String        |                            Egypt                             |
|   nativeName   |   TranslationList    |                     جمهورية مصر العربية                      |
|  translations  |   TranslationList    |       TranslationList(translations:List<Translation>)        |
|    demonym     |        String        |                          'Egyptian'                          |
|  altSpellings  |     List<String>     |             [ "EG" , "Arab Republic of Egypt" ]              |
|   alpha2Code   |        String        |                              EG                              |
|   alpha3Code   |        String        |                             EGY                              |
|  numericCode   |        String        |                             818                              |
| topLevelDomain |     List<String>     |                           ['.eg']                            |
|    capital     |        String        |                            Cairo                             |
|     region     |        String        |                            Africa                            |
|   currnecies   |     CurrencyList     |           CurrencyList(currencies:List<Currency>);           |
|   languages    | Map<String, dynamic> |          { 'eng' : 'English' , 'ara' : 'Arabic ' }           |
|    borders     |     List<String>     |                     ["LBY","PSE","SDN"]                      |
|  area [in km]  |        double        |                          1002450.0                           |
|     flags      |     List<String>     | ["https://restcountries.com/data/egy.svg","https://restcountries.com/data/png/egy.png"] |
|    flagIcon    |        String        |                             [🇪🇬]                             |
|   phoneCode    |     List<String>     |                             +20                              |
|   latitiude    |        double        |                              27                              |
|   longitude    |        double        |                              30                              |



##  Methods

This is a list of the methods you can get country data by :

|      Method       |  Return Type  |              Description              |              Example               |
| :---------------: | :-----------: | :-----------------------------------: | :--------------------------------: |
|       all()       | List<Country> |        get all countries data         |          Countries.all()           |
|     byName()      |    Country    |          get country by name          |     Countries.byName('Egypt')      |
|     byCode()      |    Country    |      get country by alpha2 code       |       Countries.byCode('EG')       |
|   byAlph3Code()   |    Country    |      get country by alpha3 code       |   Countries.byAlpha3Code('EGY')    |
|  byNumericCode()  |    Country    |      get country by numeric code      |   Countries.byNumericCode('818')   |
| byCallingCodes()  |    Country    |       get country by phone code       |  Countries.byCallingCodes('+20')   |
|    byCapital()    |    Country    |        get country by capital         |    Countries.byCapital('Cairo')    |
|     byFlag()      |    Country    |       get country by flag emoji       |       Countries.byFlag('🇪🇬')       |
| byLanguageCode()  | List<Country> |     get country by language code      |  Countries.byLanguageCode('ara')   |
| byLanguageName()  | List<Country> |     get country by language name      | Countries.byLanguageName('Arabic') |
|    unMembers()    | List<Country> |       get UN Members countries        |       Countries.unMembers()        |
|    byRegion()     | List<Country> |        get countries by region        |    Countries.byRegion('Africa')    |
|     byArea()      |    Country    |         get countries by area         |     Countries.byArea(1002450)      |
| areaBiggerThan()  | List<Country> | get countries Bigger than given area  | Countries.areaBiggerThan(1002450)  |
| areaSmallerThan() | List<Country> | get countries Smaller than given area | Countries.areaSmallerThan(1002450) |



## Development

Want to contribute? Great 😄 .. all good contributions to this package are welcome



## Credit

thanks for [amatos](https://gitlab.com/amatos/rest-countries/) for the json country data 