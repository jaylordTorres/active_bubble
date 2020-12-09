import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingContainer extends StatelessWidget {
  const SettingContainer({Key key}) : super(key: key);
  void _onLogout() async {
    await FirebaseAuth.instance.signOut();
    print('logout');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(16),
          child: Text(
            'Settings',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Expanded(
          child: Container(),
        ),
        // Divider(),
        ListTile(
          leading: Icon(Icons.person),
          title: Text('Creadits', style: Theme.of(context).textTheme.bodyText1),
          onTap: _onLogout,
        ),
        // Divider(),
        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text('Logout',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Colors.red,
                  )),
          onTap: _onLogout,
        )
      ],
    );
  }
}
