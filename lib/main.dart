import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:findoutlierapp/bloc/outlier_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "FindOutlierApp",
      home: MyHomePageProvider(),
    );
  }
}

class MyHomePageProvider extends StatelessWidget {
  const MyHomePageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OutlierBloc>(create: (context)=>OutlierBloc(), child: const MyHomePage(),);
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
        child: buildBlocBuilder(),
      ),
    );
  }

  Widget buildBlocBuilder() {
    return BlocBuilder<OutlierBloc, OutlierState>(
      builder: (context, state) {
        if (state is OutlierLoading) {
          return loadingView();
        } else if (state is OutlierLoaded) {
          return mainWithResultView(state.outlierValue);
        } else {
          return mainView();
        }
      },
    );
  }

  Widget loadingView() => const CircularProgressIndicator();

  Widget mainWithResultView(int outlier) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //App title
          Column(
            children: [
              const SizedBox(
                height: 100,
                child: Text(
                  "FindOutlierApp",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.blue,
                  ),
                ),
              ),

              SizedBox(
                height: 100,
                child: Text(
                  "Outlier value: $outlier",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 40,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
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
              BlocProvider.of<OutlierBloc>(context)
                  .add(GetOutlierValue(numbers));
            },
            child: const Text(
              "Search for the outlier!",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
        
  Widget mainView() => Column(
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
              BlocProvider.of<OutlierBloc>(context)
                  .add(GetOutlierValue(numbers));
            },
            child: const Text(
              "Search for the outlier!",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
}
