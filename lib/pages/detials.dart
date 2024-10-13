import 'package:flutter/material.dart';

// Second Page to display details
class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> args =
    ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String infoProduct = args['infoProduct']!;
    final String imageUrl = args['imageUrl']!;
    final String tag = args['tag']!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: tag, // Same tag for the Hero transition
              child: const Icon(
                Icons.info,
                size: 100,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 20),
            Text(infoProduct, style:const  TextStyle(fontSize: 24)),
            Image.network(imageUrl, height: 150, width: 150),
          ],
        ),
      ),
    );
  }
}
