import 'package:flutter/material.dart';
import 'package:wedev_test/route/route_manager.dart';

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
        child: Form(
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
                child: Text(AppLocalization.of(context).getTranslatedValue('sign_in'), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
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

              TextInputField(
                controller: _passwordTextController,
                prefixIcon: const Icon(Icons.lock_outline_sharp, size: 22,),
                hint: AppLocalization.of(context).getTranslatedValue('password'),
                obscureText: true,
                suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.visibility, size: 22,)),
                validator: (value) {
                  if(value == null || value.isEmpty) return AppLocalization.of(context).getTranslatedValue('this_field_cannot_empty');
                  return null;
                },
              ),

              const SizedBox(height: 40,),

              ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  if(_formKey.currentState!.validate()) {
                    Navigator.pushNamedAndRemoveUntil(context, RouteManager.homePage, (_) => false);
                  }
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                ),
                child: Text(AppLocalization.of(context).getTranslatedValue('login'), style: const TextStyle(fontSize: 17),),
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
        ),
      ),
    );
  }
}
