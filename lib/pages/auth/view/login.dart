import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedev_test/barrel/resources.dart';
import 'package:wedev_test/pages/auth/bloc/auth_bloc.dart';
import 'package:wedev_test/pages/auth/cubit/toggle_visibility_cubit.dart';
import 'package:wedev_test/route/route_manager.dart';

import '../../../barrel/utils.dart';
import '../../../barrel/widgets.dart';
import '../../../localization/app_localization.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthBloc(),
            ),
            BlocProvider(
              create: (context) => ToggleVisibilityCubit(),
            ),
          ],
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthLoadingState) {
                MyProgressIndicator.showTextProgressIndicator(context);
              }
              if (state is LoginSuccessState) {
                MyProgressIndicator.dismiss(context);
                currentUser = state.user;
                MySnackBar.show(
                  context: context,
                  title: AppLocalization.of(context).getTranslatedValue('success'),
                  message: AppLocalization.of(context).getTranslatedValue('login_success'),
                  type: SnackBarType.success,);
                Navigator.of(context).pushNamedAndRemoveUntil(RouteManager.homePage, (route) => false);
              }
              if (state is LoginFailedState) {
                MyProgressIndicator.dismiss(context);
                MySnackBar.show(
                  context: context,
                  title: AppLocalization.of(context).getTranslatedValue('failed'),
                  message: state.message,
                  type: SnackBarType.error,);
              }
            },
            builder: (context, state) {
              return Form(
                key: _formKey,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  children: [

                    const SizedBox(height: 40,),

                    Center(
                      child: InkWell(
                        onTap: (){},
                        child: Image.asset('assets/images/logo.png'),
                      ),
                    ),

                    const SizedBox(height: 40,),

                    Center(
                      child: Text(AppLocalization.of(context).getTranslatedValue('sign_in'), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                    ),

                    const SizedBox(height: 40,),

                    TextInputField(
                      controller: _emailTextController,
                      prefixIcon: const Icon(Icons.email_outlined, size: 22,),
                      hint: AppLocalization.of(context).getTranslatedValue('email'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if(value == null || value.isEmpty) return AppLocalization.of(context).getTranslatedValue('this_field_cannot_empty');
                        return null;
                      },
                    ),

                    const SizedBox(height: 20,),

                    BlocBuilder<ToggleVisibilityCubit, bool>(
                      builder: (context, state) {
                        return TextInputField(
                          controller: _passwordTextController,
                          prefixIcon: const Icon(Icons.lock_outline_sharp, size: 22,),
                          hint: AppLocalization.of(context).getTranslatedValue('password'),
                          obscureText: state,
                          suffixIcon: IconButton(
                            onPressed: () {
                              context.read<ToggleVisibilityCubit>().toggle();
                            },
                            icon: Icon(state ? Icons.visibility : Icons.visibility_off, size: 22,),
                          ),
                          validator: (value) {
                            if(value == null || value.isEmpty) return AppLocalization.of(context).getTranslatedValue('this_field_cannot_empty');
                            return null;
                          },
                        );
                      },
                    ),

                    const SizedBox(height: 40,),

                    ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        if(_formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(OnLoginEvent(email: _emailTextController.text, pass: _passwordTextController.text));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          backgroundColor: kPrimaryColor,
                      ),

                      child: Text(AppLocalization.of(context).getTranslatedValue('login'), style: const TextStyle(fontSize: 17, color: Colors.white),),
                    ),

                    const SizedBox(height: 40,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Image.asset('assets/icons/facebook.png', height: 22, width: 22,),
                            ),
                          ),
                        ),

                        const SizedBox(width: 20,),

                        InkWell(
                          onTap: () {},
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Image.asset('assets/icons/google.png', height: 22, width: 22,),
                            ),
                          ),
                        )
                      ],
                    ),

                    const SizedBox(height: 10,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppLocalization.of(context).getTranslatedValue("don't_have_account"), style: const TextStyle(fontSize: 17),),
                        TextButton(
                          onPressed: () => Navigator.pushNamed(context, RouteManager.signUp),
                          child: Text(
                            AppLocalization.of(context).getTranslatedValue('sign_up'),
                            style: const TextStyle(fontSize: 17),
                          ),
                        )
                      ],
                    ),

                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
