import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../res/components/custom_button.dart';
import '../utils/routes/route_name.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController _emailEditingController = TextEditingController();
  TextEditingController _passwordEditingController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  ValueNotifier<bool> _passwordnotifier = ValueNotifier<bool>(true);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _passwordnotifier.dispose();
  }
  @override
  Widget build(BuildContext context) {

    final authviewmodel = Provider.of<AuthViewModel>(context);
    return Scaffold(
        backgroundColor: Colors.amber,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Icon(Icons.person,color: Colors.red,size: 100,),
                TextFormField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailEditingController,
                  focusNode: emailFocusNode,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Email',
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.red),
                    prefixIcon: Icon(Icons.email_outlined,color: Colors.red,),

                  ),
                  onFieldSubmitted: (value){
                    Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
                  },
                ),
                SizedBox(height: 10,),
                ValueListenableBuilder(
                    valueListenable: _passwordnotifier,
                    builder: (context, value , child){
                      return TextFormField(
                        cursorColor: Colors.black,
                        obscureText: _passwordnotifier.value,
                        obscuringCharacter: "*",
                        focusNode: passwordFocusNode,
                        keyboardType: TextInputType.emailAddress,
                        controller: _passwordEditingController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          labelText: "Password",
                          labelStyle: TextStyle(color: Colors.red),
                          prefixIcon: Icon(Icons.lock_outline,color: Colors.red,),
                          suffixIcon: InkWell(
                              onTap: (){
                                _passwordnotifier.value = !_passwordnotifier.value;
                              },
                              child: Icon(_passwordnotifier.value?
                              Icons.visibility_off: Icons.visibility,color: Colors.red,)),
                        ),
                      );
                    }),
                SizedBox(height: 20,),
                ButtonCustom(title: 'Register',
                    loading: authviewmodel.signupLoading,
                    onPressed: (){
                      if(_emailEditingController.text.isEmpty){
                        Utils.toastMessage("Please enter Email!");
                      }else if(_passwordEditingController.text.isEmpty){
                        Utils.toastMessage("Please enter Password!");
                      }else if(_passwordEditingController.text.length<6){
                        Utils.toastMessage("Password needs to be more than 6 characters!");
                      }else{
                        Map data ={
                          // 'email' : _emailEditingController.text.toString(),
                          // 'password': _passwordEditingController.text.toString()
                          "email": "eve.holt@reqres.in",
                          "password": "pistol"
                        };
                        authviewmodel.RegisterApi(data , context);
                      }

                    }),
                SizedBox(height: 20,),
                InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, RouteNames.login);
                    },
                    child: Text("Already have an account? Log-In Here!" ,
                    style: TextStyle(fontSize: 16),)),

              ],
            ),
          ),
        )
    );
  }
}
