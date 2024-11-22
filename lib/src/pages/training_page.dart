import 'package:flutter/material.dart';
import 'package:my_trainer/src/states/global_state.dart';
import 'package:provider/provider.dart';

// Stateful widgets are user interactable widgets
class TrainingPage extends StatelessWidget {
  //Create a list of the items as a Placeholder

  final List<WorkOutPlan> workoutPlans = [
    WorkOutPlan(
      title: "WorkPlan",
      description: "good Workout",
      imageURL:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3BQ8mg69CijTs06mBVquJ-asiXLCCPz22Q_QaEiNBQDtRYlK6T-AUI6Q&s",
    ),
    WorkOutPlan(
      title: "WorkPlan",
      description: "good Workout",
      imageURL:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdK2dN8jtBtKrlMCJbTeq3WBwxKcaPMLjz2yT9Gk_XjRxz1zA3lifFXg0&s",
    ),
    WorkOutPlan(
      title: "WorkPlan",
      description: "Good Workout",
      imageURL:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3q1PRuKbx3QqmOdT9mb_AuXW9EwpwkNdNETkC0Y_sJz-2d-KhCph4Gis&s",
    ),
    WorkOutPlan(
      title: "WorkPlan",
      description: "good Workout",
      imageURL:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRj4SvBlMXqzObqrkxQykQFqIPaN8MX7gvILdNRC0Jw_jnB7tmrKg54p5o&s",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<GlobalState>();

    var theme = Theme.of(context);
    final textStyle = theme.textTheme.titleLarge!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Workout Plans", style: textStyle),
        iconTheme: IconThemeData(
          color: theme.colorScheme.onPrimary, //change your color here
        ),
      ),
      body: ListView.builder(
        itemCount: workoutPlans.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
            child: workoutPlans[index],
          );
        },
      ),
    );
  }
}

class WorkOutPlan extends StatelessWidget {
  final String title;
  final String description;
  final String imageURL;

  WorkOutPlan({
    required this.title,
    required this.description,
    required this.imageURL,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.cyanAccent,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              imageURL,
              height: 150.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 150.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              height: 75,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(8.5),
                    bottomLeft: Radius.circular(8.5)),
                color: Colors.black.withOpacity(0.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
