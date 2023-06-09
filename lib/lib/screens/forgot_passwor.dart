
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maptest/lib/widgets/customized_button.dart';



import '../widgets/customized_textfield.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();
  //final FirebaseFirestore firestore = FirebaseFirestore.instance;
  void reset() async {
    try {      showDialog(
        context: context,
        builder: (context) => AlertDialog(backgroundColor: Colors.transparent,
            title:
            Center(child: CircularProgressIndicator(color: Colors.orange,)),

            actions: [
            ]));
      await  FirebaseAuth.instance.
      sendPasswordResetEmail(email: _emailController.text);
    showDialog(
        context: context,
        builder: (context) => AlertDialog(backgroundColor: Colors.transparent,
            title:
            Center(child: Text('Check your email \nfor reset link')),

            actions: [
            ]));
    } catch (e) {

      showDialog(
          context: context,
          builder: (context) => AlertDialog(backgroundColor: Colors.white,
              title:
              Center(child:Text(e.toString()) ),

              actions: [
              ]));
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SizedBox (
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_sharp),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Forgot Password?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            const Padding(
              padding:  EdgeInsets.all(8.0),
              child: Text(
                  "Dont worry it occurs to us all. We will send you a link to reset your password.",
                  style: TextStyle(
                    color: Color(0xff8391A1),
                    fontSize: 20,
                    // fontWeight: FontWeight.bold,
                  )),
            ),
            CustomizedTextfield(
              myController: _emailController,
              hintText: "Enter your Email",
              isPassword: false,
            ),
            CustomizedButton(
              buttonText: "Send Email",
              buttonColor: Colors.black,
              textColor: Colors.white,
              onPressed: () {

reset();
                Navigator.pop(context);
              },
            ),
            const Spacer(
              flex: 1,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(68, 8, 8, 8.0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Remember Password?",
                      style: TextStyle(
                        color: Color(0xff1E232C),
                        fontSize: 15,
                      )),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text("  Login",
                        style: TextStyle(
                          color: Color(0xff35C2C1),
                          fontSize: 15,
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
