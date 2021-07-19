import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notebook/notebook_class.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

const String NAME_BOX = 'name_box';
class NotebookHomeScreen extends StatefulWidget {

  @override
  _NotebookHomeScreenState createState() => _NotebookHomeScreenState();
}

class _NotebookHomeScreenState extends State<NotebookHomeScreen> {
  var controller = ScrollController();
  ScrollPhysics _physics = BouncingScrollPhysics();

  @override
  Widget build(BuildContext context) {
    final notebookbox = Hive.box(NAME_BOX);
    return Scaffold(
      appBar: AppBar(
        title: Text('My notes',style: TextStyle(fontFamily: 'RaleBold'),),
        centerTitle: true,
        backgroundColor: Colors.orange,

      ),
      backgroundColor: Colors.cyan[100],
      body:ValueListenableBuilder(
          valueListenable: notebookbox.listenable(),
          builder: (context,notebookbox,_){
              return Align(
                alignment: Alignment.topCenter,
                child: ListView.builder(
                  controller: controller,
                    physics: _physics,
                    reverse: true,
                    shrinkWrap: true,
                    itemCount: notebookbox.length,
                    itemBuilder: (BuildContext context,int index){
                      final note = notebookbox.getAt(index) as NotebookModel;
                      return Card(
                        color: Colors.amber[400],
                        elevation: 10,
                        child: Slidable(
                          actionPane:SlidableDrawerActionPane(),
                          secondaryActions: [
                            IconSlideAction(
                              caption: 'Delete',
                              color: Colors.deepOrange,
                              icon: Icons.delete,
                              onTap: () => notebookbox.deleteAt(index),
                            )
                          ],
                          child: ListTile(
                            title: Text(note.name, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,color: Colors.black87,fontFamily: 'RaleBold'),),
                            subtitle: Text(note.desc,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal,color: Colors.black38,fontFamily: 'MontMedium')),
                          ),
                        ),
                      );

                    }
                ),
              );
          }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: Icon(
          Icons.add,
              color: Colors.white,
        ),
        onPressed: (){
          Navigator.pushNamed(context, 'add_screen');
        },

      ),
    );
  }

}

