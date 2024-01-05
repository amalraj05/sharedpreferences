import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class shared extends StatefulWidget {
  const shared({super.key});

  @override
  State<shared> createState() => _sharedState();
}

class _sharedState extends State<shared> {
  String? noteValue;

  @override
  void initState(){
    super.initState();
    getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Notes List Screen"),
        
      ),
      body: Center(
        child:
         noteValue == null ? Text("No Notes Available") : Text(noteValue!),
      ),
      );
  }

  void getNotes() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    noteValue = pref.getString("noteData");
    setState(() {
      
    });
  }
}