import 'package:adaproject_cryptic/screens/algo_list.dart';
import 'package:adaproject_cryptic/screens/appbar.dart';
import 'package:flutter/material.dart';

import 'package:adaproject_cryptic/Theme.dart' as Theme;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new HomePageBody(),
    );
  }
}

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() => new _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new GradientAppBar("Cryptic"),
        new PlanetList(),
        Container(
          color: Theme.Colors.planetPageBackground,
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
            style: flatButtonStyle,
            child: Text(
              'About',
              style: Theme.TextStyles.planetTitle,
            ),
            onPressed: () {
              showAlertDialog(context);
            },
          ),
        )
      ],
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("About Us"),
      content: Text("Made with ♥ in Flutter for ADA project"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    primary: Colors.black87,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(40.0)),
    ),
  );
}
