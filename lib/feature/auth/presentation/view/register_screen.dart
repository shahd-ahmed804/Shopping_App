import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_app/core/common/widget/custom_form_text_fiel.dart';
import 'package:shoping_app/core/dialogs/app_dialogs.dart';
import 'package:shoping_app/core/utils/validator_functions.dart';
import 'package:shoping_app/feature/auth/data/api/auth_api.dart';
import 'package:shoping_app/feature/auth/data/repo/data_source/auth_data_source_impl.dart';
import 'package:shoping_app/feature/auth/domain/entities/request/register_request_entity.dart';
import 'package:shoping_app/feature/auth/domain/repo/data_source/auth_data_source_interface.dart';
import 'package:shoping_app/feature/auth/domain/repo/repo/auth_repo.dart';
import 'package:shoping_app/feature/auth/data/repo/repo/auth_repo_impl.dart';
import 'package:toastification/toastification.dart';
import '../../../../core/dialogs/app_toasts.dart';
import '../../domain/use_case/login_use_case.dart';
import '../../domain/use_case/register_use_case.dart';
import '../view_model/auth_cubit.dart';
import 'login_screen.dart';






class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const String routeName = "RegisterScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();
  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
 late final AuthCubit cubit;
  @override
  void initState() {
    super.initState();
   cubit = AuthCubit(
     loginUseCase: injectLoginUseCase(),
     registerUseCase: injectRegisterUseCase(),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SignUp",
        ),
      ),
      body: BlocListener<AuthCubit, AuthState>(
        bloc: cubit,
       listener: (context, state) {
          if(state is LoadingState){
            AppDialogs.showLoadingDialog(context);
          }if(state is ErrorState){
            Navigator.of(context).pop();
            AppToast.showToast(
                context: context,
                title: "Error",
                description: state.errorMessage,
                type: ToastificationType.error);
          }
          if(state is SuccessState){
            Navigator.of(context).pushNamedAndRemoveUntil(LoginScreen.routeName,
                    (route)=>false);
          }
  },
  child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Text(
                "User Name",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 5),
              CustomTextFormField(
                controller: userNameController,
                validator: Validator.validateName,
                hintText: "Enter your userName",
                keyboardType: TextInputType.emailAddress,
                action: TextInputAction.next,
              ),
              SizedBox(height: 30),
              Text(
                "Email",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 5),
              CustomTextFormField(
                controller: emailController,
                validator: Validator.validateEmail,
                hintText: "Enter your email",
                keyboardType: TextInputType.emailAddress,
                action: TextInputAction.next,
              ),
              SizedBox(height: 30),
              Text(
                "Password",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 5),
              CustomTextFormField(
                controller: passwordController,
                validator: Validator.validatePassword,
                hintText: "Enter your password",
                isPassword: true,
                keyboardType: TextInputType.emailAddress,
                action: TextInputAction.next,
              ),
              SizedBox(height: 30),
              Text(
                "Confirm Password",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 5),
              CustomTextFormField(
                controller: confirmPasswordController,
                validator: (value) =>
                    Validator.validateConfirmPassword(value, passwordController.text),
                hintText: "Enter your confirm password",
                isPassword: true,
                keyboardType: TextInputType.emailAddress,
                action: TextInputAction.done,
              ),
              SizedBox(height: 30),
              MaterialButton(
                minWidth: double.infinity,
                height: 50,
                onPressed: () async{
                  if (formKey.currentState!.validate()) {
                await cubit.register(RegisterRequestEntity(
                  name: userNameController.text,
                  email:emailController.text,
                 password:  passwordController.text,
                )
                );
                  }
                  },
                color: Color(0xff212121),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Sign up",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffFFFFFF),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.noAnimation,
      floatingActionButton: MediaQuery.of(context).viewInsets.bottom == 0
          ? Align(
              alignment: Alignment.bottomCenter,
              child: Text.rich(
                TextSpan(
                  text: "Already have an account? ",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff6E6A7C),
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.of(context).pop();
                    },
                  children: [
                    TextSpan(
                      text: "Login",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff212121),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : null,
    );
  }
}
