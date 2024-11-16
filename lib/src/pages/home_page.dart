import 'package:flutter/material.dart';

import '../utils/enums.dart';
import '../widgets/main_menu_navigation.dart';
import 'favorites_page.dart';
import 'generator_page.dart';
import 'workout_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedIndex = 0; // Set to start on the Workout page by default

  @override
  Widget build(BuildContext context) {
    Widget page;

    // Updated switch with break statements
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
      case 1:
        page = FavoritesPage();
      default:
        throw UnimplementedError('No widget for $selectedIndex');
    }

    //FIXME: The navigation only works when pressing the text fields not the icon

    // Updated List with tap handling for each MainMenuNavigationBlock
    List<Widget> menuList = [
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WorkOutPage()),
          );
        },
        child: MainMenuNavigationBlock(page: MenuPage.progress),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WorkOutPage()),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            //TODO: make the container smaller
            //color: Colors.blue,  // Example color for the box
            borderRadius: BorderRadius.circular(10),  // Example border radius for rounded corners
          ),
          child: MainMenuNavigationBlock(page: MenuPage.training),
        )

      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WorkOutPage()),
          );
        },
        child: MainMenuNavigationBlock(page: MenuPage.nutrition),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WorkOutPage()),
          );
        },
        child: MainMenuNavigationBlock(page: MenuPage.challenges),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WorkOutPage()),
          );
        },
        child: MainMenuNavigationBlock(page: MenuPage.calender),
      ),
    ];

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
              child: Text("Bem vindo de volta!", style: textStyle),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: menuList,
              ),
            ),
          ],
        ),
      ),
      // Bottom navigation bar to switch between pages
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.build), label: 'Generator'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
        ],
      ),
    );
  }
}
/* FIXME: Don't see why we need this
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
*/