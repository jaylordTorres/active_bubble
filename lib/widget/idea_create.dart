import 'package:active_bubble/text_content/message.dart';
import 'package:active_bubble/util/util.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../class/class.dart';
import '../constant/main.dart';

class IdeaCreate extends StatefulWidget {
  final Function callback;
  const IdeaCreate({Key key, this.callback}) : super(key: key);

  @override
  _IdeaCreateState createState() => _IdeaCreateState();
}

class _IdeaCreateState extends State<IdeaCreate> {
  TextEditingController _content = TextEditingController();
  bool loading = false;
  _onSubmit(context) async {
    try {
      setState(() {
        loading = true;
      });

      final doc =
          FirebaseFirestore.instance.collection(FireCollections.article).doc();
      doc.set({
        "id": doc.id,
        "cb": FirebaseFirestore.instance
            .collection(FireCollections.user)
            .doc(Store.user.uid),
        "cd": new DateTime.now(),
        "c": _content.text
      });
      setState(() {
        loading = false;
      });
      Toast.show(UiMessage.success, context);
      Navigator.of(context).pop();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Post:", style: Theme.of(context).textTheme.caption),
              Row(children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: TextFormField(
                    controller: _content,
                    maxLength: 350,
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 10,
                  ),
                )),
                _button
              ])
            ],
          )),
    );
  }

  get _button {
    return ElevatedButton(
      onPressed: !loading
          ? () {
              _onSubmit(context);
              widget.callback();
            }
          : null,
      child: Icon(Icons.ac_unit_outlined),
    );
  }
}
