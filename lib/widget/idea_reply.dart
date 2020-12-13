import 'package:flutter/material.dart';

import '../class/idea_model.dart';

class IdeaReply extends StatelessWidget {
  final IdeaModel idea;
  final Function callback;
  const IdeaReply({Key key, this.idea, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Reply to ${idea.user.fullName}:",
                style: Theme.of(context).textTheme.caption,
              ),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: TextFormField(
                      maxLength: 150,
                    ),
                  )),
                  ElevatedButton(
                    onPressed: () {
                      callback();
                    },
                    child: Icon(Icons.ac_unit_outlined),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
