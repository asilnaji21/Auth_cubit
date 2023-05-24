import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:flutter_11_4_2023_cubit/business_logic/Auth/auth_states.dart';


import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/Auth/auth_cubit.dart';
import '../custom/TextFormFiled.dart';
import '../custom/customfooter.dart';
import 'login_view.dart';


class RegisterScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final genderController = TextEditingController();
  final fullNameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey  = GlobalKey<FormState>();
  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          showDialog(
              builder: (context) => AlertDialog(
                  backgroundColor: Colors.white,
                  content: AnimatedContainer(
                    duration: const Duration(seconds: 3),
                    curve: Curves.easeInOut,
                    child: Row(
                      children: const [
                        CupertinoActivityIndicator(color: Colors.black),
                        SizedBox(
                          width: 12.5,
                        ),
                        Text(
                          "wait",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  )),
              context: context);
        } else if (state is RegisterFailureState) {
          showDialog(
              builder: (context) => AlertDialog(
                    backgroundColor: Colors.red,
                    content: Text(state.errorMessage),
                  ),
              context: context);
        } else if (state is RegisterSuccessState) {
          Navigator.pop(context);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginView()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: const Text(""),
          ),
          body: Center(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key:formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       const  Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 22.5, fontWeight: FontWeight.bold),
                        ),
                      const   SizedBox(
                          height: 30,
                        ),
                         customTextForm(
                            hintTitle: "Full Name",
                            controller: fullNameController),
                       const  SizedBox(
                          height: 20,
                        ),
                         customTextForm(
                            hintTitle: "Email", controller: emailController),
                       const  SizedBox(
                          height: 20,
                        ),
                         customTextForm(
                  hintTitle: "Password",
                  controller: passwordController,
                  obscureText: context.watch<AuthCubit>().isPasswordVisible,
                  suffixIcon: context.watch<AuthCubit>().isPasswordVisible
                      ? Icons.visibility_off
                      : Icons.visibility,
                  togglePasswordVisibility:
                     context.read<AuthCubit>().togglePasswordVisibility,
                ),
                      const   SizedBox(height: 20),
                         customTextForm(
                            hintTitle: "Gendar", controller: genderController),
                      const   SizedBox(height: 20),
                        MaterialButton(
                          minWidth: double.infinity,
                          elevation: 0,
                          height: 40,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          color: Colors.black,
                          onPressed: () {
                           
                             if (formKey.currentState!.validate()) {
  context.read<AuthCubit>().validateAndRegister(
       fullName: fullNameController.text,
       email: emailController.text,
       password: passwordController.text,
       gender: genderController.text);
}
                           
                          },
                          child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                state is RegisterLoadingState
                                    ? "Loading..."
                                    : "Register",
                                style:const  TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.5,
                                    color: Colors.white),
                              )),
                        ),
                       const  SizedBox(
                          height: 20,
                        ),
                   const CustomFotter()
                      ],
                    ),
                  ),
                )),
          ),
        );
      },
    );
  }
}
