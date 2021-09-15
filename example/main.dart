import 'package:countries_utils/flutter_country.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Country> countries = Countries.all();

    return Scaffold(
        body: Center(
      child: CupertinoPicker(
          onSelectedItemChanged: (i) {},
          scrollController: FixedExtentScrollController(initialItem: 67),
          offAxisFraction: .1,
          diameterRatio: 1.1,
          itemExtent: 50.0,
          magnification: 1.4,
          squeeze: 1.45,
          useMagnifier: true,
          looping: true,
          children: countries
              .map((country) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      Localizations.localeOf(context).languageCode == "en"
                          ? '${country.name} ${country.flagIcon}'
                          : '${country.nativeName}  ${country.flagIcon}',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ))
              .toList()),
    ));
  }
}
