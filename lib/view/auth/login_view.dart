import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/Auth/auth_cubit.dart';
import '../../business_logic/Auth/auth_states.dart';
import '../custom/TextFormFiled.dart';
import '../custom/customfooter.dart';
import '../home/home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                  backgroundColor: Colors.white,
                  content: AnimatedContainer(
                    duration: const Duration(seconds: 3),
                    curve: Curves.easeIn,
                    child: Row(
                      children: const [
                        CupertinoActivityIndicator(color: Colors.blue),
                        SizedBox(
                          width: 12.5,
                        ),
                        Text(
                          "wait",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  )));
        } else if (state is LoginSuccessState) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    content: Text(state.message),
                  ));
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => CategoriesScreen()));
        } else if (state is LoginFailureState) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    content: Text(state.errorMessage),
                  ));
        }
      },
      builder: (context, state) => Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Form(
            key: formKey,
            child: ListView(
              children: <Widget>[
                const Text(
                  "Learn cubits for beginners",
                  style: TextStyle(fontSize: 22),
                ),
                const SizedBox(
                  height: 55,
                ),
                customTextForm(hintTitle: "Email", controller: emailController),
                const SizedBox(
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
                      context.watch<AuthCubit>().togglePasswordVisibility,
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  minWidth: double.infinity,
                  elevation: 0,
                  height: 40,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  color: Colors.black,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<AuthCubit>().validateAndUserLogin(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                    }
                  },
                  child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        state is RegisterLoadingState ? "Loading..." : "Login",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.5,
                            color: Colors.white),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomFotter()
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
