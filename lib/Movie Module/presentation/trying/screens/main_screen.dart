import 'package:flutter/material.dart';
import 'package:movies/Movie%20Module/presentation/trying/widgets/now_playing_widget.dart';
import 'package:movies/core/providers/main_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/category_list.dart';

class MainScreen extends StatelessWidget {
  static const id = 'MainScreen';
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF424242),
      body: ListView(
        children: [
          CarouselForNowPlayingWidget(
            mainProvider: mainProvider,
            mq: mq,
          ),
          CategoryListWidget(
            mq: mq,
            mainProvider: mainProvider,
          ),
        ],
      ),
    );
  }
}
