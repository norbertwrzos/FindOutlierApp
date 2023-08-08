import 'package:flutter/material.dart';
import 'package:findoutlierapp/screens/result_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            //App title
            const SizedBox(
              height: 200,
              child: Text(
                "FindOutlierApp",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.blue,
                ),
              ),
            ),

            //Textfield, provide numbers
            Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: _controller,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0)),
                  label: const Text(
                    "Enter decimal numbers, using coma as a separator",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    softWrap: true,
                  ),
                ),
              ),
            ),

            //Activate logic button
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
              onPressed: () {
                final List<int> numbers =
                    _controller.text.split(',').map(int.parse).toList();
                final int outlier = findOutlier(numbers);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(outlier: outlier),
                  ),
                );
              },
              child: const Text(
                "Search for the outlier!",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

//Logic
  int findOutlier(List<int> numbers) {
    int evenCount = 0;
    int oddCount = 0;
    int? even;
    int? odd;

    for (final int number in numbers) {
      if (number.isEven) {
        evenCount++;
        even = number;
      } else {
        oddCount++;
        odd = number;
      }
    }

    if (evenCount > 1 && oddCount == 1) {
      return odd!;
    } else if (oddCount > 1 && evenCount == 1) {
      return even!;
    }

    return 0;
  }
}
