import 'package:day_20/welcomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formKey=GlobalKey<FormState>();
  TextEditingController fname=TextEditingController();
  TextEditingController lname=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: ()
        {
       showBottom();
        },
            child: Text("Show Bottom Sheet")),
      ),
    );
  }

  void showBottom() {
    showModalBottomSheet(context: context, builder: (context) {
      return Container(
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            ListTile(
              title: Text("First Person"),
              subtitle: Text(fname.text+'\t'+lname.text ),
              leading: Icon(Icons.person),
              trailing:GestureDetector(
                onTap: () {
                  showdialog();
                },
                  child: Icon(Icons.edit)
              )
            ),
            ListTile(
              title: Text("Second Person"),
              subtitle: Text(fname.text+'\t'+lname.text),
              leading: Icon(Icons.person),
                trailing:GestureDetector(
                    onTap: () {
                      showdialog();
                    },
                    child: Icon(Icons.edit)
                )
            ),
          ],
        ),
      );
    });
  }

  void showdialog() {
     showDialog(context: context, builder: (context){
       return Dialog(
         backgroundColor: Colors.blueGrey,
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.all(Radius.circular(20))
         ),
          child: Container(
            width: double.maxFinite,
            height: 250,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                    key: formKey,
                      child: Column(
                    children: [
                      TextFormField(
                        /*validator: (value){
                          if(!value!.contains("@"))
                          {
                            return "Enter a valid email Address";
                          }
                        },*/
                        keyboardType: TextInputType.text,
                        controller: fname,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            labelText: "Enter Fast Name",
                            hintText: "Enter your Fast Name",
                            /*  errorText: _validate ? 'Number Can\'t Be Empty' : null,*/
                            contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.grey)
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.grey)
                            )
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        /*validator: (value){
                          if(!value!.contains("@"))
                          {
                            return "Enter a valid email Address";
                          }
                        },*/
                        keyboardType: TextInputType.text,
                         controller: lname,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            labelText: "Enter Last Name",
                            hintText: "Enter your Last Name",
                            /*  errorText: _validate ? 'Number Can\'t Be Empty' : null,*/
                            contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.grey)
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.grey)
                            )
                        ),
                      ),
                      SizedBox(height: 10,),
                      MaterialButton(onPressed: (){
                        gotoNextPage(fname.text,lname.text);
                      },
                        color: Colors.orange,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: Text("Submit"),
                      )
                    ],
                  )),
                )
              ],
            ),
          ),
       );

     });

  }

  void gotoNextPage(String text, String text2) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomePage(fastname: text,lastname: text2 ),
    ),
    );
    /*

      number:email.text,
        password:password.text,
     */
  }
}
