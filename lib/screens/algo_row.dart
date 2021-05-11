import 'package:adaproject_cryptic/algo_model.dart';
import 'package:adaproject_cryptic/screens/2d_transformation_screen.dart';
import 'package:adaproject_cryptic/screens/huffman_coding_screen.dart';
import 'package:adaproject_cryptic/screens/lzw_screen.dart';
import 'package:flutter/material.dart';
import 'package:adaproject_cryptic/Theme.dart' as Theme;
import 'package:page_transition/page_transition.dart';

class PlanetRow extends StatelessWidget {
  final Planet planet;

  PlanetRow(this.planet);

  @override
  Widget build(BuildContext context) {
    final planetThumbnail = new Container(
      alignment: new FractionalOffset(0.0, 0.5),
      margin: const EdgeInsets.only(left: 24.0),
      child: new Hero(
        tag: 'planet-icon-${planet.id}',
        child: new Image(
          image: new AssetImage(planet.image),
          height: Theme.Dimens.planetHeight,
          width: Theme.Dimens.planetWidth,
        ),
      ),
    );

    final planetCard = new Container(
      margin: const EdgeInsets.only(left: 72.0, right: 24.0),
      decoration: new BoxDecoration(
        color: Theme.Colors.planetCard,
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
              color: Colors.black,
              blurRadius: 10.0,
              offset: new Offset(0.0, 10.0))
        ],
      ),
      child: new Container(
        margin: const EdgeInsets.only(top: 16.0, left: 72.0),
        constraints: new BoxConstraints.expand(),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(planet.name, style: Theme.TextStyles.planetTitle),
            new Container(
                color: const Color(0xFF00C6FF),
                width: 24.0,
                height: 1.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0)),
            new Row(
              children: <Widget>[
                new Text(planet.location,
                    style: Theme.TextStyles.planetLocation),
              ],
            )
          ],
        ),
      ),
    );

    return new Container(
      height: 120.0,
      margin: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: new FlatButton(
        onPressed: () => _navigateTo(context, planet.id),
        child: new Stack(
          children: <Widget>[
            planetCard,
            planetThumbnail,
          ],
        ),
      ),
    );
  }

  _navigateTo(context, String id) {
    if (id == '1') {
      Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.bottomToTop,
              child: HuffmanCodingScreen()));
    }
    if (id == '2') {
      Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.bottomToTop, child: LZWCodingScreen()));
    }
    if (id == '3') {
      Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.bottomToTop,
              child: TransformationsScreen()));
    }
  }
}
