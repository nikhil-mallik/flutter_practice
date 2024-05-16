import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Unknown Route"),
      ),
      body: Center(
        child: Text(
          "Page Not Found",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
