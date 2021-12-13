import 'package:breakbaddata/screens/episode/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controller.dart';

class EpisodeScreen extends StatelessWidget {
  const EpisodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => EpisodesController()..getEpisodeData(),
      child: BlocConsumer<EpisodesController, EpisodeState>(
        listener: (context, state) {},
        builder: (context, state) {
          final controller = EpisodesController.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Breaking Bad Episode'),
            ),
            body: controller.listData.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                        horizontal: size.shortestSide * .06,
                        vertical: size.longestSide * .03),
                    itemBuilder: (context, i) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(children: [
                              TextSpan(
                                  text:
                                      "Title: \"${controller.listData[i].title}\"\n"),
                              TextSpan(
                                  text:
                                      "Season: \"${controller.listData[i].season}\"\n"),
                              TextSpan(
                                  text:
                                      "Episode: \"${controller.listData[i].episode}\"\n"),
                              TextSpan(
                                  text:
                                      "Series: \"${controller.listData[i].series}\"\n"),
                              const TextSpan(text: "Charactors: "),
                              WidgetSpan(
                                  child: Wrap(
                                children: List.generate(
                                    controller.listData[i].characters.length,
                                    (index) => Container(
                                          decoration: BoxDecoration(
                                            color: Colors.blueGrey.shade500,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          padding: EdgeInsets.all(
                                              size.shortestSide * .03),
                                          margin: EdgeInsets.all(
                                              size.shortestSide * .01),
                                          child: Text(
                                              controller.listData[i]
                                                  .characters[index],
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize:
                                                    size.shortestSide * .035,
                                              )),
                                        )),
                              ))
                            ]),
                            style: TextStyle(
                                fontSize: size.shortestSide * .048,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, i) {
                      return Divider(
                        thickness: 1.5,
                        height: size.longestSide * .06,
                        color: Colors.black,
                        indent: size.shortestSide * .15,
                        endIndent: size.shortestSide * .15,
                      );
                    },
                    itemCount: 20),
          );
        },
      ),
    );
  }
}
