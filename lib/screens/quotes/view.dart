import 'package:breakbaddata/screens/quotes/controller.dart';
import 'package:breakbaddata/screens/quotes/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuotesScreen extends StatelessWidget {
  const QuotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => QuotesController()..getQuotesData(),
      child: BlocConsumer<QuotesController, QuotesState>(
        listener: (context, state) {},
        builder: (context, state) {
          final controller = QuotesController.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Breaking Bad Quotes'),
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
                                      "Quote: \"${controller.listData[i].quote}\"\n"),
                              TextSpan(
                                  text:
                                      "Author: \"${controller.listData[i].author}\"\n"),
                              TextSpan(
                                  text:
                                      "Movie: \"${controller.listData[i].series}\""),
                            ]),
                            style: TextStyle(
                                fontSize: size.shortestSide * .043,
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
