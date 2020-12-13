import 'package:active_bubble/constant/model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../widget/idea_card.dart';

class IdeasContainer extends StatefulWidget {
  const IdeasContainer({Key key}) : super(key: key);

  @override
  _IdeasContainerState createState() => _IdeasContainerState();
}

class _IdeasContainerState extends State<IdeasContainer> {
  Query query = FirebaseFirestore.instance
      .collection(FireCollections.article)
      .orderBy("cd", descending: true);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: query.snapshots(),
        builder: (context, stream) {
          if (stream.connectionState == ConnectionState.waiting) {
            return LinearProgressIndicator();
          }
          if (stream.hasError) {
            return Center(
              child: Text(
                stream.error.toString(),
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: Colors.red),
              ),
            );
          }
          QuerySnapshot querySnapshot = stream.data;
          return body(context, querySnapshot);
        });
  }

  Widget body(BuildContext context, QuerySnapshot data) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return IdeaCard(
                key: Key(data.docs[index].id),
                idea: data.docs[index],
              );
            },
            childCount: data.size,
          ),
        )
      ],
    );
  }
}
