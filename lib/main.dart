import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notebook/add_activity_screen.dart';
import 'package:notebook/notebook_class.dart';
import 'package:notebook/notebook_home_screen.dart';
import 'package:path_provider/path_provider.dart' as path_provider;


const String NAME_BOX = 'name_box';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumenDirectoryPath =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumenDirectoryPath.path);
  Hive.registerAdapter(NotebookModelAdapter());
  runApp(NotebookApp());
}

class NotebookApp extends StatefulWidget {
  @override
  State<NotebookApp> createState() => _NotebookAppState();
}

class _NotebookAppState extends State<NotebookApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        'add_screen' : (context) => Add_Activity()
      },
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: Hive.openBox(NAME_BOX),
        builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              if(snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return NotebookHomeScreen();
              }
            } else {
              return const Scaffold(
                backgroundColor: Colors.cyan,
                body: Center(
                  child: Text('Loading...', style: TextStyle(fontSize: 20, color: Colors.amberAccent,fontFamily: 'RaleBold'),),
                ),
              );
            }
        },
      ),
    );
  }

  @override
  void dispose() {
    Hive.box(NAME_BOX).compact();
    Hive.box(NAME_BOX).close();
    super.dispose();
  }
}
