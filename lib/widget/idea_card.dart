import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widget/idea_reply.dart';
import '../util/util.dart';

class IdeaCard extends StatefulWidget {
  const IdeaCard({Key key, this.idea}) : super(key: key);
  final QueryDocumentSnapshot idea;

  @override
  _IdeaCardState createState() => _IdeaCardState();
}

class _IdeaCardState extends State<IdeaCard> {
  IdeaModel idea;
  @override
  void initState() {
    _onLoad();
    super.initState();
  }

  _onLoad() async {
    final data = widget.idea.exists
        ? await IdeaModel.fromQuerySnopShotAsync(widget.idea)
        : null;

    setState(() {
      idea = data;
    });
  }

  // final IdeaModel idea;
  void _onReply(context, idea) {
    final callBack = () {
      Navigator.of(context).pop();
    };
    showBottomSheet(
        context: context,
        builder: (conext) {
          return Container(
              width: double.infinity,
              child: IdeaReply(
                idea: idea,
                callback: callBack,
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    if (idea == null) {
      return Container(child: Text(''));
      // return Container(
      //   padding: EdgeInsets.symmetric(vertical: 16),
      //   child: Center(child: CircularProgressIndicator()),
      // );
    }
    return Dismissible(
      confirmDismiss: (direction) async {
        // Toast.show(UiMessage.workingInprogress, context);
        _onReply(context, widget.idea);
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
