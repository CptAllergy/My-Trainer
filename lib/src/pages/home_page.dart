import 'package:flutter/material.dart';

import '../widgets/main_menu_navigation.dart';
import 'favorites_page.dart';
import 'generator_page.dart';
import '../utils/enums.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
      case 1:
        page = FavoritesPage();
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    List<Widget> menuList = [];
    menuList.add(MainMenuNavigationBlock(page: MenuPage.progress));
    menuList.add(MainMenuNavigationBlock(page: MenuPage.training));
    menuList.add(MainMenuNavigationBlock(page: MenuPage.nutrition));
    menuList.add(MainMenuNavigationBlock(page: MenuPage.challenges));
    menuList.add(MainMenuNavigationBlock(page: MenuPage.calender));

    var theme = Theme.of(context);
    final textStyle = theme.textTheme.titleLarge!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Bem vindo de volta!", style: textStyle,),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  // Generate 100 widgets that display their index in the List.
                  children: menuList
                ),
              ),
            ],
          ),
        ),

    );
  }
}

class _HomePageState2 extends State<HomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
      case 1:
        page = FavoritesPage();
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return Scaffold(
      body: Row(
        children: [
          SafeArea(
            child: NavigationRail(
              extended: false,
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.favorite),
                  label: Text('Favorites'),
                ),
              ],
              selectedIndex: selectedIndex,
              onDestinationSelected: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
            ),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: page,
            ),
          ),
        ],
      ),
    );
  }
}
