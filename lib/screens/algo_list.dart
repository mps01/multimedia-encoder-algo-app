import 'package:adaproject_cryptic/screens/algo_row.dart';
import 'package:flutter/material.dart';
import 'package:adaproject_cryptic/Theme.dart' as Theme;

import '../algos_model.dart';

class PlanetList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Flexible(
      child: new Container(
        color: Theme.Colors.planetPageBackground,
        child: new ListView.builder(
          itemExtent: 160.0,
          itemCount: 3,
          itemBuilder: (_, index) => new PlanetRow(PlanetDao.planets[index]),
        ),
      ),
    );
  }
}
