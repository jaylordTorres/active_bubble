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
  List<QueryDocumentSnapshot> data = [];
  bool loading = false;

  Query query = FirebaseFirestore.instance
      .collection(FireCollections.article)
      .orderBy("cd", descending: true)
      .limit(5);

  getData() async {
    setState(() {
      loading = true;
    });
    QuerySnapshot newData;
    if (data.isNotEmpty) {
      newData = await query.startAfterDocument(data.last).get();
    } else {
      newData = await query.get();
    }
    setState(() {
      data.addAll(newData.docs);
      loading = false;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // if (loading) {
    //   return LinearProgressIndicator();
    // }
    // print(data);
    // print(data.length.toString());
    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return IdeaCard(
                      key: Key(data.elementAt(index).id),
                      idea: data.elementAt(index),
                    );
                  },
                  childCount: data.length,
                ),
              ),
            ],
          ),
        ),
        ElevatedButton(
          child: Text('fetch'),
          onPressed: () {
            getData();
          },
        ),
        if (loading) ...{LinearProgressIndicator()},
      ],
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return StreamBuilder<QuerySnapshot>(
  //       stream: query.snapshots(),
  //       builder: (context, stream) {
  //         if (stream.connectionState == ConnectionState.waiting) {
  //           return LinearProgressIndicator();
  //         }
  //         if (stream.hasError) {
  //           return Center(
  //             child: Text(
  //               stream.error.toString(),
  //               style: Theme.of(context)
  //                   .textTheme
  //                   .subtitle1
  //                   .copyWith(color: Colors.red),
  //             ),
  //           );
  //         }
  //         QuerySnapshot querySnapshot = stream.data;
  //         return body(context, querySnapshot);
  //       });
  // }

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
