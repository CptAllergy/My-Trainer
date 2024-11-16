import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    var translations = globalState.translations;

    String pageText;
    switch (page) {
      case MenuPage.progress:
        pageText = translations.getMenuPageProgress();
      case MenuPage.training:
        pageText = translations.getMenuPageTraining();
      case MenuPage.nutrition:
        pageText = translations.getMenuPageNutrition();
      case MenuPage.challenges:
        pageText = translations.getMenuPageChallenges();
      case MenuPage.calender:
        pageText = translations.getMenuPageCalender();
    }

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
                      /* FIXME: This messes up navigation. Navigation could be added here to fix it with onTap(){}
                      onTap: () {},*/
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(pageIcon,
                          size: 60, color: theme.colorScheme.onPrimary)),
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
