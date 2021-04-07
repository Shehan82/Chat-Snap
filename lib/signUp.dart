import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  TextEditingController userNameTEC = new TextEditingController();
  TextEditingController emailTEC = new TextEditingController();
  TextEditingController passwordTEC = new TextEditingController();

  signMeUp() {
    if (formKey.currentState.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        // title: Image.asset('assets/icon.png'),
        title: Text("Chat Snap"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 50,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        child: TextFormField(
                          validator: (val) {
                            return "this will never Work";
                          },
                          controller: userNameTEC,
                          decoration: InputDecoration(
                              hintText: "User Name",
                              hintStyle:
                                  TextStyle(color: Colors.white, fontSize: 17),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: TextFormField(
                          controller: emailTEC,
                          decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle:
                                  TextStyle(color: Colors.white, fontSize: 17),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: TextFormField(
                          controller: passwordTEC,
                          decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle:
                                  TextStyle(color: Colors.white, fontSize: 17),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  )),

              SizedBox(
                height: 15,
              ),
              // Container(
              //   width: double.infinity,
              //   padding: EdgeInsets.only(right: 15, left: 15),
              //   child: Text(
              //     "Forgot Password",
              //     style: TextStyle(color: Colors.white),
              //     textAlign: TextAlign.right,
              //   ),
              // ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(15),
                height: 50,
                child: InkWell(
                  onTap: () => {signMeUp()},
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.indigo[700],
                        borderRadius: BorderRadius.circular(25)),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(15),
                height: 50,
                child: InkWell(
                  onTap: () => {print("signUp pressed!")},
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      "Sign Up with google",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  Text(
                    "Sign In now",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
