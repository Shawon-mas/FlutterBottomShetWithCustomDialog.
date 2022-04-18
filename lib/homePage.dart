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
  TextEditingController _fname=TextEditingController();
  TextEditingController _lname=TextEditingController();
  late Dialog dialog;
  @override
  void dispose() {

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: ()
        {
       showBottom();
        },
            child: Text("Add Contact to your phone")),
      ),
    );
  }

  void showBottom() {
    showModalBottomSheet(context: context, builder: (context) {
      return Container(
        height: 250,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              ListTile(

                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_fname.text,style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87
                    ),),
                    Text(_lname.text),
                  ],
                ),
                leading: Icon(Icons.person,color: Colors.black,),
                trailing:GestureDetector(
                  onTap: () {
                    showdialog();
                  },
                    child: Icon(Icons.add,color: Colors.black,)
                )
              ),

            ],
          ),
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
              mainAxisAlignment: MainAxisAlignment.center,
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
                        controller: _fname,
                        decoration: InputDecoration(
                          filled: true,
                            fillColor: Colors.orange[50],
                            prefixIcon: Icon(
                                Icons.person,
                              color: Colors.black54,
                            ),
                            hintText: "Enter Your Name",
                            /*  errorText: _validate ? 'Number Can\'t Be Empty' : null,*/
                             contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                             enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white)
                            ),
                           focusedBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(10),
                               borderSide: BorderSide(color: Colors.white)
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
                        keyboardType: TextInputType.number,
                         controller: _lname,

                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.orange[50],

                            prefixIcon: Icon(Icons.person,
                              color: Colors.black54,),
                            hintText: "Enter Your Number",

                            /*  errorText: _validate ? 'Number Can\'t Be Empty' : null,*/
                            contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.grey)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white)
                            )
                        ),
                      ),
                      SizedBox(height: 10,),
                      MaterialButton(onPressed: (){
                        gotoNextPage(_fname.text,_lname.text);
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
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomePage(fastname: text,lastname: text2 ),
    ),
    );
    /*

      number:email.text,
        password:password.text,
     */
  }
}
