import 'package:breakbaddata/screens/characters/controller.dart';
import 'package:breakbaddata/screens/characters/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => CharactersController()..getCharactersData(),
      child: BlocConsumer<CharactersController, CharacterState>(
        listener: (context, state) {},
        builder: (context, state) {
          final controller = CharactersController.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text("Breaking Bad Characters"),
              centerTitle: true,
            ),
            body: controller.listData.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : PageView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      controller.listData.length,
                      (i) => SizedBox(
                        height: size.longestSide,
                        width: size.shortestSide,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size.longestSide * .015,
                              horizontal: size.shortestSide * .05),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        controller.listData[i].img),
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: size.longestSide * .02),
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                          text:
                                              "name: ${controller.listData[i].name}\n"),
                                      TextSpan(
                                          text:
                                              "Character name: ${controller.listData[i].nickname}\n"),
                                      TextSpan(
                                          text:
                                              "Status: ${controller.listData[i].status}\n"),
                                      TextSpan(
                                          text:
                                              "Movie: ${controller.listData[i].category}\n")
                                    ],
                                  ),
                                  style: TextStyle(
                                      fontSize: size.shortestSide * .043,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
