import 'package:flutter/material.dart';
import 'package:inext_assignment/Utils/Roundbutton.dart';
import 'package:provider/provider.dart';

import '../Provider/authprovider.dart';
import '../Utils/generalUtils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  ValueNotifier<bool> _obsecurepassword = ValueNotifier<bool>(true);

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {



    _passwordController.dispose();
    _emailController.dispose();

    _obsecurepassword.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();

  }
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<Authprovider>(context, listen: false);

    final mq = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Center(
                child: Image.asset('assets/images/i1.png'
                ,height:mq.height*0.3 ,
                width: mq.width*0.6,),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.12),
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  focusNode: emailFocusNode,
                  decoration: InputDecoration(
                      hintText: "demo@gmail.com",
                      hintStyle: TextStyle(color:Color(0xFF707070)),
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.black),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color:  Color(0xFFE8E6EA),
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Colors.black), // Color when the TextFormField is in focus
                      ),
                      prefixIcon: Icon(
                        Icons.alternate_email,
                        color: Colors.black,
                      )),
                  onFieldSubmitted: (val) {
                    Utils.fieldFocusChange(
                        context, emailFocusNode, passwordFocusNode);
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              ValueListenableBuilder(
                  valueListenable: _obsecurepassword,
                  builder: (context, value, child) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.12),
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: _obsecurepassword.value,
                        focusNode: passwordFocusNode,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                          hintText: "password",
                          hintStyle: TextStyle(color: Color(0xFF707070)),
                          labelText: "Password",
                          prefixIcon: Icon(Icons.lock,
                              color:Colors.black),
                          suffixIcon: InkWell(
                              onTap: () {
                                _obsecurepassword.value =
                                    !_obsecurepassword.value;
                              },
                              child: Icon(
                                _obsecurepassword.value
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility,
                                color: _obsecurepassword.value
                                    ? Colors.black
                                    : Colors.black,
                              )),
                          labelStyle: TextStyle(color: Colors.black),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color:  Color(0xFFE8E6EA))),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color:Colors.black), // Color when the TextFormField is in focus
                          ),
                        ),
                      ),
                    );
                  }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  RoundButton(title: "Login", onpress: (){

                    if(_emailController.text.isEmpty){
                      Utils.flushBarErrorMessage("Email Cannot be empty", context);
                    }
                    else if(_passwordController.text.isEmpty){
                      Utils.flushBarErrorMessage("Password cannot be empty", context);
                    }else if(_passwordController.text.length<6){
                      Utils.flushBarErrorMessage("Lenght of password must be of six character", context);
                    }
                    else{
                      authProvider.Loginn(context,_emailController.text.toString(),_passwordController.text.toString());
                      // Navigator.push(context, Routes.generateRoute(RouteSettings(name:  RoutesName.ProfileDetails)));
                      print("api hit");
                    }


                  })
            ]),
          ),
        ),
      ),
    );
  }
}
