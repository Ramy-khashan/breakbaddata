import 'package:breakbaddata/screens/death/controller.dart';
import 'package:breakbaddata/screens/death/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeathScreen extends StatelessWidget {
  const DeathScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => DeathController()..getDeathData(),
      child: BlocConsumer<DeathController, DeathState>(
        listener: (context, state) {},
        builder: (context, state) {
          final controller = DeathController.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Breaking Bad Death'),
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
                                      "Responsible: \"${controller.listData[i].responsible}\"\n"),
                              TextSpan(
                                  text:
                                      "Dead man: \"${controller.listData[i].death}\"\n"),
                              TextSpan(
                                  text:
                                      "Cause: \"${controller.listData[i].cause}\"\n"),
                              TextSpan(
                                  text:
                                      "LastWord: \"${controller.listData[i].lastWords == "Unknown" ? "No LastWord" : controller.listData[i].lastWords}\"\n"),
                              TextSpan(
                                  text:
                                      "season: ${controller.listData[i].season}\n"),
                              TextSpan(
                                  text:
                                      "episode: ${controller.listData[i].episode}"),
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
