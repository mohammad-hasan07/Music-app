import 'package:flutter/material.dart';

class ServiceDetailScreen extends StatelessWidget {
  final String title;
  const ServiceDetailScreen(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Service Detail"),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          child: Text("You tapped on: $title", style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}
