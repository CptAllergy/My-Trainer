import 'package:flutter/material.dart';
import 'package:my_trainer/src/utils/localization_service.dart';
import 'package:provider/provider.dart';

import '../pages/calender_page.dart';
import '../pages/challenges_page.dart';
import '../pages/nutrition_page.dart';
import '../pages/progress_page.dart';
import '../pages/training_page.dart';
import '../states/global_state.dart';
import '../utils/enums.dart';

class MainMenuNavigationBlock extends StatelessWidget {
  const MainMenuNavigationBlock({
    super.key,
    required this.page,
  });

  final MenuPage page;

  @override
  Widget build(BuildContext context) {
    var globalState = context.watch<GlobalState>();
    var translations = LocalizationService.of(context);

    String pageText = translations.translate("home.nav.${page.name}");

    IconData pageIcon;
    switch (page) {
      case MenuPage.progress:
        pageIcon = Icons.insights_outlined;
      case MenuPage.training:
        pageIcon = Icons.fitness_center_outlined;
      case MenuPage.nutrition:
        pageIcon = Icons.local_dining_outlined;
      case MenuPage.challenges:
        pageIcon = Icons.diamond_outlined;
      case MenuPage.calender:
        pageIcon = Icons.calendar_month_outlined;
    }

    Widget pageWidget;
    switch (page) {
      case MenuPage.progress:
        pageWidget = ProgressPage();
      case MenuPage.training:
        pageWidget = TrainingPage();
      case MenuPage.nutrition:
        pageWidget = NutritionPage();
      case MenuPage.challenges:
        pageWidget = ChallengesPage();
      case MenuPage.calender:
        pageWidget = CalenderPage();
    }

    var theme = Theme.of(context);
    final textStyle = theme.textTheme.titleLarge!.copyWith(
      color: theme.colorScheme.onPrimary,

    );

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Material(
            borderRadius: BorderRadius.circular(20.0),
            color: theme.colorScheme.primary,
            child: Column(
              children: [
                SizedBox(
                  height: 120,
                  width: 120,
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => pageWidget),
                        );
                      },
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                          pageIcon,
                          size: 60,
                          color: theme.colorScheme.onPrimary)
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              pageText,
              style: textStyle,
            ),
          )
        ],
      ),
    );
  }
}
