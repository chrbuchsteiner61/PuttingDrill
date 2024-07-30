import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:myapp/user_areas/input_screen.dart';
import 'package:myapp/user_areas/results_screen.dart';

class DrillLine extends StatelessWidget {
  final String drillName;
  final String drillPicture;

  const DrillLine(
      {super.key, required this.drillName, required this.drillPicture});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(drillPicture),
            width: 50,
            height: 50,
          ),
          SizedBox(
            width: 70,
            child: Text(drillName),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InputScreen()),
              );
            },
            child: Text(localizations!.inputResults),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ResultsScreen()),
              );
            },
            child: Text(localizations.viewResults),
          ),
        ],
      ),
    );
  }
}
