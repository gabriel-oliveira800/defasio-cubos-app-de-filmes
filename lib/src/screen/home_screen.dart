import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/src/controllers/tab_store.dart';

import 'components/header_app.dart';
import 'components/tab_categories.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    final tabStore = Modular.get<TabStore>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 48,
            horizontal: 20,
          ),
          child: Column(
            children: [
              HeaderApp(onChanged: (v) => print(v)),
              Observer(
                builder: (_) => TabCategories(
                  categories: tabStore.categories,
                  onChangedTab: tabStore.setCurrentTab,
                  currentTabSelected: tabStore.currentTab,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
