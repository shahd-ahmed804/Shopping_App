
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_app/core/dialogs/app_dialogs.dart';
import 'package:shoping_app/core/dialogs/app_toasts.dart';
import 'package:shoping_app/feature/app_section/app_section.dart';
import 'package:shoping_app/feature/auth/domain/entities/request/login_request_entity.dart';
import 'package:shoping_app/feature/auth/domain/use_case/login_use_case.dart';
import 'package:shoping_app/feature/auth/domain/use_case/register_use_case.dart';
import 'package:shoping_app/feature/auth/presentation/view/register_screen.dart';
import 'package:toastification/toastification.dart';
import '../../../../core/common/widget/custom_form_text_fiel.dart';
import '../../../../core/utils/validator_functions.dart';
import '../view_model/auth_cubit.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = "LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  late final  TextEditingController emailController ;
 late final TextEditingController passwordController ;
late final AuthCubit cubit;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    cubit = AuthCubit(
      loginUseCase: injectLoginUseCase(),
      registerUseCase: injectRegisterUseCase(),
    );
  }
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
      ),),
      body: BlocListener<AuthCubit, AuthState>(
        bloc: cubit,
  listener: (context, state) {
 if(state is LoadingState){
   AppDialogs.showLoadingDialog(context);
 }
 if(state is ErrorState){
   Navigator.of(context).pop();
   AppToast.showToast(
       context: context,
       title: "Error",
       description: state.errorMessage,
       type: ToastificationType.error);
 }
 if(state is SuccessState){
   Navigator.of(context).pushNamedAndRemoveUntil(AppSection.routeName,
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
              MaterialButton(
                minWidth: double.infinity,
                height: 50,
                onPressed: () async{
                  if (formKey.currentState!.validate()) {
                  await  cubit.login(
                    LoginRequestEntity(
                      email:emailController.text,
                      password:passwordController.text,
                    ),
                  );
                  }
                },
                color: Color(0xff212121),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Login",
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
     // floatingActionButtonAnimator: FloatingActionButtonAnimator.noAnimation,
      floatingActionButton: MediaQuery.of(context).viewInsets.bottom == 0
          ? Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).pushNamed(RegisterScreen.routeName);
                },
                child: Text.rich(
                  TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff6E6A7C),
                    ),
                    children: [
                      TextSpan(
                        text: "Sign Up",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff212121),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
