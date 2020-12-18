
  
  

# flutter_country

![enter image description here](https://img.shields.io/github/issues/egyleader/flutter_country) ![enter image description here](https://img.shields.io/github/forks/egyleader/flutter_country) ![enter image description here](https://img.shields.io/github/stars/egyleader/flutter_country) ![enter image description here](https://img.shields.io/twitter/url?url=https://github.com/egyleader/flutter_country)

A lite flutter package for providing World Country Data without internet connection

### Installation

depend on the package in your pubspec.yaml :

```sh
dependencies:
flutter_country: ^0.0.1
```
get the packages :
```sh
flutter pub get
```

### parameters

This is a list of the properties that can be provided for each country


| Parameter | Example |
| ------ | ------ |
| name | Egypt |
| officialName | Arab Republic of Egypt |
| nativeName | جمهوريةمصرالعربية |
| alpha2Code | EG |
| alpha3Code | EGY |
| numericCode | 818 |
| olympicCode | EGY |
| independent | true |
| unMember | true |
| topLevelDomain | .eg |
| phoneCode | +20 |
| capital | Cairo |
| regions | [Africa] |
| subRegion | Northern Africa |
| area [in km] | 1002450 |
| flag | 🇪🇬 |
| coordinates | [27,30]  [latitiude,longitude] |

  
  
  

### Metods

This is a list of the methods you can get country data by :

  

| Method | Example |
| ------ | ------ |
| all() | Countries.all() |
| byName() | Countries.byName('Egypt') |
| byCode() | Countries.byCode('EG') |
| byAlph3Code()| Countries.byAlpha3Code('EGY') |
| byNumericCode() | Countries.byNumericCode('818') |
| byPhoneCode() | Countries.byPhoneCode('+20') 
| byCapital() | Countries.byCapital('Cairo')|
| byFlag() |Countries.byFlag('🇪🇬')|
| byLanguageCode() | Countries.byLanguageCode('ara')|
| byLanguageName() | Countries.byLanguageName('Arabic')|
| unMembers() | Countries.unMembers()|
| independent() | Countries.independent()|
| byRegion() | Countries.byRegion('Africa')|
| bySubRegion() | Countries.bySubRegion('Southern Europe')|
| byArea() | Countries.byArea(1002450)|
| areaBiggerThan() | Countries.areaBiggerThan(1002450)|
| areaSmallerThan() |Countries.areaSmallerThan(1002450)|


### Development

Want to contribute? Great 😄! all good contributions are welcome



### Credit
thanks for [mledoze/countries](https://github.com/mledoze/countries) for the country data 

