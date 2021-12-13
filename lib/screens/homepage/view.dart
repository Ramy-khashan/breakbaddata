import 'package:breakbaddata/component/button.dart';
import 'package:breakbaddata/screens/characters/view.dart';
import 'package:breakbaddata/screens/death/view.dart';
import 'package:breakbaddata/screens/episode/view.dart';
import 'package:breakbaddata/screens/quotes/view.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: size.longestSide * .28,
            alignment: Alignment.center,
            child: Text(
              "Breaking Bad",
              style: TextStyle(
                  fontFamily: 'head',
                  fontSize: size.shortestSide * .11,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w700),
            ),
          ),
          ButtonItem(
            head: "Quotes",
            size: size,
            onPress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const QuotesScreen()));
            },
          ),
          ButtonItem(
            head: "Death",
            size: size,
            onPress: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const DeathScreen()));
            },
          ),
          ButtonItem(
            head: "Characters",
            size: size,
            onPress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CharactersScreen()));
            },
          ),
          ButtonItem(
            head: "Episode",
            size: size,
            onPress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EpisodeScreen()));
            },
          )
        ],
      ),
    );
  }
}
