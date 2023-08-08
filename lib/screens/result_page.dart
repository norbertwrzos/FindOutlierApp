import 'package:flutter/material.dart';
import 'package:findoutlierapp/main.dart';

class ResultPage extends StatelessWidget {
  final int outlier;

  const ResultPage({Key? key, required this.outlier}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Description text
            const Text(
              "Outlier value:",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 50),
            ),

            // Outlier value display
            Text(
              textAlign: TextAlign.center,
              '$outlier',
              style: const TextStyle(fontSize: 80, color: Colors.blue),
            ),
            const SizedBox(height: 20),

            // Back to HomePage button
            ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0)))),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyApp())),
              child: const Text(
                "Back",
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
