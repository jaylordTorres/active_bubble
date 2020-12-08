import 'package:flutter/material.dart';

import '../util/util.dart';

class IdeaCard extends StatelessWidget {
  const IdeaCard({Key key, this.idea}) : super(key: key);
  final IdeaModel idea;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      confirmDismiss: (direction) async {
        Toast.show(UiMessage.workingInprogress, context);
        return false;
      },
      key: Key(idea.id.toString()),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                leading: CircleAvatar(
                    backgroundImage:
                        CachedNetworkImageProvider(idea.user.image)),
                title: SelectableText(
                  StringUtils.capitalize(idea.user.fullName),
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                // subtitle: Text(''),
              ),
              Card(
                margin: EdgeInsets.only(left: 55),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SelectableText(
                    idea.content,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
