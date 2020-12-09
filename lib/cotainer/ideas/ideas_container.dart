import 'package:flutter/material.dart';
import '../../widget/idea_card.dart';
import '../../class/idea_model.dart';

class IdeasContainer extends StatelessWidget {
  const IdeasContainer({Key key, this.data}) : super(key: key);
  final List<IdeaModel> data;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return IdeaCard(
              key: Key(data[index].id.toString()),
              idea: data[index],
            );
          }, childCount: data.length),
        )
      ],
    );
  }
}
