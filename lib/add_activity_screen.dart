import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notebook/notebook_class.dart';
import 'notebook_home_screen.dart';

const String NAME_BOX = 'name_box';
class Add_Activity extends StatefulWidget {
  const Add_Activity({Key key}) : super(key: key);

  @override
  _Add_ActivityState createState() => _Add_ActivityState();
}

class _Add_ActivityState extends State<Add_Activity> {
    final contactsBox = Hive.box(NAME_BOX);
    final _formkey = GlobalKey<FormState>();
    final _formkey2 = GlobalKey<FormState>();
    String _descError;
    String _nameError;

  TextEditingController textnamecontroller = TextEditingController();
  TextEditingController textdesccontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent[100],
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Create Note', style: TextStyle(color: Colors.white, fontFamily: 'RaleBold'),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              ),
                  Form(
                    key: _formkey,
                    child: TextFormField(
                      validator: (value){
                        if(value.isEmpty || value == null || value.length < 5){
                          return 'Field text less than 5 characters';
                        }
                          return null;
                      },
                      maxLength: 15,
                      controller: textnamecontroller,
                decoration: InputDecoration(
                  labelText: 'Name',
                   labelStyle: TextStyle(fontFamily: 'MontReg', color: Colors.black45),
                   filled: true,
                   errorText: _nameError,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                    ),
                    hintText: 'Enter Title',
                    hintStyle: TextStyle(fontFamily: 'MontReg'),
                    icon: Icon(Icons.drive_file_rename_outline)
                ),
              ),
                  ),
              Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              ),
              Form(
                key: _formkey2,
                child: TextFormField(
                  validator: (value){
                    if(value.isEmpty || value == null || value.length < 10){
                      return 'Field text less than 10 characters';
                    }
                      return null;
                  },
                  maxLength: 200,
                  maxLines: 12,
                  controller: textdesccontroller,
                  decoration: InputDecoration(
                    errorText: _descError,
                    labelText: 'Description',
                      labelStyle: TextStyle(fontFamily: 'MontReg', color: Colors.black45),
                    fillColor: Colors.white,
                    filled: true,
                      border: OutlineInputBorder(
                      ),
                      hintText: 'Enter Description',
                      hintStyle: TextStyle(fontFamily: 'MontReg'),
                      icon: Icon(Icons.description)

                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0),
              ),
              SizedBox(
                width: 220.0,
                height: 50.0,
                child: ElevatedButton(
                   style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
                    child: Text('Save', style: TextStyle(color : Colors.white,fontSize: 20,fontFamily: 'RaleBold'), ),
                    onPressed: (){
                  final String title = textnamecontroller.text;
                  final String desc = textdesccontroller.text;
                  setState(() {
                    if(_formkey.currentState.validate() && _formkey2.currentState.validate()){
                      final newnote = NotebookModel(name: title, desc: desc,completed: false);
                      contactsBox.add(newnote);
                      Navigator.pushNamedAndRemoveUntil(context,'/', (route) => false);
                    }
                  });

                }
                ),
              )

            ],
          ),
        ),
      ) ,
    );
  }
}
