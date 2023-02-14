import 'package:flutter/material.dart';

import 'Grassroots_request.dart';
import 'study.dart';
import 'package:deep_pick/deep_pick.dart';

class HomeS extends StatefulWidget {
  const HomeS({super.key});

  @override
  State<HomeS> createState() => _HomeState();
}

class _HomeState extends State<HomeS> {
  StudyGrassroots? study;

  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    // FECHT DATA
    getData();
  }

  getData() async {
    study = await RemoteServiceSingle().getPosts();

    final String? header =
        pick(study, 'header', 'schema', 'so:softwareVersion').asStringOrNull();
    debugPrint('Getting study successfully');

    print(study?.results[0].results[0].data.soName);

    //print('test, ${tests?.title}!');

    if (study != null)
      setState(() {
        isLoaded = true;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('fetching list')),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
            //wrap listView with widget
            //itemCount: study?.results.length, //ADD
            itemCount: 1,
            itemBuilder: (context, index) {
              return Container(
                //child: Text('Hello'),
                child: Text('Name of study: ' +
                    study!.results[0].results[0].data.soName),
                //child: Text(tests!.userId.toString()),
              );
            }),
      ),
    );
  }
}
