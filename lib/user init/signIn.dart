
import 'package:flutter/material.dart';
import 'package:kalpas_test/home/main.dart';
import 'package:kalpas_test/user%20init/signup.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width*1,
                      height: MediaQuery.of(context).size.height*0.95,
                      child: Container(
                        color: Colors.black,
                      )),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(40.0, 100.0, 10.0, 0),
                    child: Text(
                      "Welcome!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0.0,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width*01,
                      height: MediaQuery.of(context).size.height*0.5,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Color(0XFFE7E2E2),
                            borderRadius: BorderRadius.vertical(top: Radius.circular(70))
                        ),
                        child: Column(
                          children: [
                            const Center(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(8.0, 15.0, 8.0, 8.0),
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(
                                        fontSize: 30
                                    ),
                                  ),
                                )
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: Colors.brown,
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width*0.75,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "Email:",
                                      contentPadding: const EdgeInsets.fromLTRB(7.0, 10.0, 5.0, 2.0),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: Colors.brown,
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width*0.75,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.fromLTRB(7.0, 10.0, 5.0, 2.0),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                      labelText: "Password:",
                                      fillColor: Colors.brown,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            ElevatedButton(onPressed: (){
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (BuildContext context)=> const Home()
                                  )
                              );
                            }, child: const Text('Sign In')),
                            Row(
                                children: const [
                                  Expanded(
                                      child: Divider(
                                        color: Colors.black,
                                        indent: 40,
                                      )
                                  ),
                                  Text("Or Sign In With"),
                                  Expanded(
                                      child: Divider(
                                        color: Colors.black,
                                        endIndent: 40,
                                      )
                                  ),
                                ]
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    child: const Icon(Icons.android),
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(50,50),
                                      shape: const CircleBorder(),
                                    ),
                                  ),
                                  ElevatedButton(
                                    child: const Icon(Icons.android),
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(50,50),
                                      shape: const CircleBorder(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(100.0, 0.0, 0.0, 0.0),
                              child: Row(
                                children: [
                                  const Text("Don't Have an account?"),
                                  TextButton(onPressed: (){
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context)=> const SignUp()
                                        )
                                    );
                                  }, child: const Text("Sign Up")),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}
