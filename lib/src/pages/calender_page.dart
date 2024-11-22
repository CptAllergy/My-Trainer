import 'package:flutter/material.dart';
import 'package:my_trainer/src/states/global_state.dart';
import 'package:provider/provider.dart';

//TODO THIS PAGE IS CURRENTLY A PLACEHOLDER

class CalenderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<GlobalState>();

    var theme = Theme.of(context);
    final textStyle = theme.textTheme.titleLarge!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Calender", style: textStyle),
        iconTheme: IconThemeData(
          color: theme.colorScheme.onPrimary, //change your color here
        ),
      ),
      body: Center(child: Text("Calender", style: textStyle)),
    );
  }
}
