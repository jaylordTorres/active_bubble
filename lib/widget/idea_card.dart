import 'package:active_bubble/class/Idea_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../util/util.dart';

class IdeaCard extends StatelessWidget {
  const IdeaCard({Key key, this.idea}) : super(key: key);
  final IdeaModel idea;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              leading: CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(idea.user.image)),
              title: Text(
                StringUtils.capitalize(idea.user.fullName),
                style: Theme.of(context).textTheme.subtitle1,
              ),
              // subtitle: Text(''),
            ),
            Card(
              margin: EdgeInsets.only(left: 55),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  idea.content,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
