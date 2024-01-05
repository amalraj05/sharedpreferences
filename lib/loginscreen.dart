import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferences/home.dart';


class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  String? noteValue;
  
  @override
  void initState(){
    super.initState();
    
  }
  get notesController => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Column(
          children: [
            SizedBox(height: 120,),
            SizedBox(
              height: 50,
              child: TextField(
                controller: notesController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    
                  ),
                  hintText: "User name"
                ),
                
              ),
            ),
            
            SizedBox(height: 40,),
            SizedBox(
              height: 40,
              width: 90,
              child: 
                  
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      primary: Colors.blue[500],
                      onPrimary: Colors.white
                    ),
                    onPressed: () {
                      setNotesData(notesController.Text); 
                      
                    },
                   child: Text("save")),
                
            ),
            SizedBox(height: 50,),
            ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      primary: Colors.blue[500],
                      onPrimary: Colors.white
                    ),
                    onPressed: () {
                       Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => shared()));
                      
                    },
                   child: Text("view Notes")),
          ],
        ),
      ),
    );
  }

  Future<void> setNotesData(noteValue) async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("noteData", noteValue);
  }
  
}