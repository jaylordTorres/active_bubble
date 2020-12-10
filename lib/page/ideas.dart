import 'package:flutter/material.dart';
import '../class/idea_model.dart';
import '../constant/main.dart';
import '../container/ideas/ideas.dart';
import '../data/data.dart';
import '../widget/widget.dart';

// final data = ideas.map((e) => IdeaModel.fromJson(e)).toList();

class IdeasPage extends StatefulWidget {
  static UiRoutes route = UiRoutes.root;
  const IdeasPage({Key key}) : super(key: key);

  @override
  _IdeasPageState createState() => _IdeasPageState();
}

class _IdeasPageState extends State<IdeasPage> {
  int _selectedContainer = 0;

  Widget builder() {
    switch (_selectedContainer) {
      case 0:
        return IdeasContainer();
      case 2:
        return SettingContainer();
        break;
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return UiPage(
      child: Scaffold(
        floatingActionButton: IdeaCreateFloatingButton(),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                _selectedContainer = index;
              });
            },
            currentIndex: _selectedContainer,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.ballot), label: "Feeds"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list), label: "My Posts"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
            ]),
        body: AnimatedSwitcher(
          child: builder(),
          duration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}

class IdeaCreateFloatingButton extends StatelessWidget {
  const IdeaCreateFloatingButton({
    Key key,
  }) : super(key: key);

  _create(context) {
    showBottomSheet(
        context: context,
        builder: (_) {
          return IdeaCreate();
        });
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: 'Post',
      child: Icon(Icons.post_add_rounded),
      onPressed: () => _create(context),
    );
  }
}
