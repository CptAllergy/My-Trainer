import 'package:flutter/material.dart';

import '../utils/enums.dart';
import '../utils/localization_service.dart';
import '../widgets/main_menu_navigation.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var translations = LocalizationService.of(context);
    
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
              child: Text(translations.translate("home.welcome"), style: textStyle),
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
    );
  }
}