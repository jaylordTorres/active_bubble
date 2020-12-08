import 'package:active_bubble/class/Idea_model.dart';
import 'package:active_bubble/data/data.dart';
import 'package:flutter/material.dart';
import '../constant/main.dart';
import '../widget/widget.dart';

final data = ideas.map((e) => IdeaModel.fromJson(e)).toList();

class IdeasPage extends StatelessWidget {
  static UiRoutes route = UiRoutes.root;
  const IdeasPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UiPage(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.ballot), label: "Feeds"),
          BottomNavigationBarItem(icon: Icon(Icons.post_add), label: "Create"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ]),
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return IdeaCard(
                  idea: data[index],
                );
              }, childCount: data.length),
            )
          ],
        ),
      ),
    );
  }
}
