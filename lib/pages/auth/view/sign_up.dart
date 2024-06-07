import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedev_test/barrel/resources.dart';
import 'package:wedev_test/localization/app_localization.dart';

import '../../../barrel/utils.dart';
import '../../../barrel/widgets.dart';
import '../bloc/auth_bloc.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final _formKey = GlobalKey<FormState>();
  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _confirmPassTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => AuthBloc(),
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthLoadingState) {
                MyProgressIndicator.showTextProgressIndicator(context);
              }
              if (state is RegistrationSuccessState) {
                MyProgressIndicator.dismiss(context);
                MySnackBar.show(
                  context: context,
                  title: AppLocalization.of(context).getTranslatedValue('success'),
                  message: state.message,
                  type: SnackBarType.success,);
                clearTextField();
                Navigator.of(context).pop;
              }
              if (state is RegistrationFailedState) {
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

                    Center(
                      child: InkWell(
                        onTap: (){},
                        child: Image.asset('assets/images/profile.png'),
                      ),
                    ),

                    TextInputField(
                      controller: _nameTextController,
                      prefixIcon: const Icon(Icons.person_outline, size: 22,),
                      hint: AppLocalization.of(context).getTranslatedValue('name'),
                      validator: (value) {
                        if(value == null || value.isEmpty) return AppLocalization.of(context).getTranslatedValue('this_field_cannot_empty');
                        return null;
                      },
                    ),

                    const SizedBox(height: 20,),

                    TextInputField(
                      controller: _emailTextController,
                      prefixIcon: const Icon(Icons.email_outlined, size: 22,),
                      hint: AppLocalization.of(context).getTranslatedValue('email'),
                      validator: (value) {
                        if(value == null || value.isEmpty) return AppLocalization.of(context).getTranslatedValue('this_field_cannot_empty');
                        return null;
                      },
                    ),

                    const SizedBox(height: 20,),

                    TextInputField(
                      controller: _passwordTextController,
                      prefixIcon: const Icon(Icons.lock_outline_sharp, size: 22,),
                      hint: AppLocalization.of(context).getTranslatedValue('password'),
                      validator: (value) {
                        if(value == null || value.isEmpty) return AppLocalization.of(context).getTranslatedValue('this_field_cannot_empty');
                        return null;
                      },
                    ),

                    const SizedBox(height: 20,),

                    TextInputField(
                      controller: _confirmPassTextController,
                      prefixIcon: const Icon(Icons.lock_outline_sharp, size: 22,),
                      hint: AppLocalization.of(context).getTranslatedValue('confirm_password'),
                      validator: (value) {
                        if(value == null || value.isEmpty) return AppLocalization.of(context).getTranslatedValue('this_field_cannot_empty');
                        if(value != _passwordTextController.text) return AppLocalization.of(context).getTranslatedValue('password_not_matched');
                        return null;
                      },
                    ),

                    const SizedBox(height: 40,),

                    ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        if(_formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(OnRegistrationEvent(name: _nameTextController.text, email: _emailTextController.text, pass: _passwordTextController.text));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        backgroundColor: kPrimaryColor,
                      ),
                      child: Text(AppLocalization.of(context).getTranslatedValue('sign_up'), style: const TextStyle(fontSize: 17, color: Colors.white),),
                    ),

                    const SizedBox(height: 40,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Image.asset('assets/icons/facebook.png', height: 22, width: 22,),
                          ),
                        ),

                        const SizedBox(width: 20,),

                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Image.asset('assets/icons/google.png', height: 22, width: 22,),
                          ),
                        )
                      ],
                    ),

                    const SizedBox(height: 10,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppLocalization.of(context).getTranslatedValue('already_have_account'), style: const TextStyle(fontSize: 17),),
                        TextButton(onPressed: () => Navigator.pop(context), child: Text(AppLocalization.of(context).getTranslatedValue('login'), style: const TextStyle(fontSize: 17),))
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

  void clearTextField() {
    _nameTextController.clear();
    _emailTextController.clear();
    _passwordTextController.clear();
    _confirmPassTextController.clear();
  }
}
