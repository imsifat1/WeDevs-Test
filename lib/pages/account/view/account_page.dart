import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedev_test/barrel/utils.dart';

import '../../../barrel/widgets.dart';
import '../../../localization/app_localization.dart';
import '../../../route/route_manager.dart';
import '../../auth/bloc/auth_bloc.dart';
import '../cubit/trailing_icon_cubit.dart';

class AccountPage extends StatelessWidget {
  AccountPage({Key? key}) : super(key: key);

  final _emailTextController = TextEditingController(text: currentUser?.userEmail ?? '');
  final _nameTextController = TextEditingController(text: currentUser?.userDisplayNme ?? '');
  final _addressTextController = TextEditingController();
  final _houseTextController = TextEditingController();
  final _zipTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _confirmPassTextController = TextEditingController();

  final _mySharedPreference =MySharedPreference();

  final _passwordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: AppLocalization.of(context).getTranslatedValue('my_account'),
        backButtonEnabled: false,
        actions: [
          IconButton(
            onPressed: () {

              confirmationDialog(
                context: context, title: AppLocalization.of(context).getTranslatedValue('sign_out'),
                message: AppLocalization.of(context).getTranslatedValue('sign_out_message'),
                onNegative: () {},
                onPositive: () {
                  _mySharedPreference.remove(MySharedPreference.currentUser);
                  currentUser = null;
                  Navigator.pushNamedAndRemoveUntil(context, RouteManager.login, (route) => false);
                }
              );


            },
            tooltip: AppLocalization.of(context).getTranslatedValue('sign_out'),
            icon: Icon(Icons.logout, color: Colors.black, size: 22,),
          )
        ],
      ),

      body: BlocProvider(
        create: (context) => AuthBloc(),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthLoadingState) {
              MyProgressIndicator.showTextProgressIndicator(context);
            }
            if (state is UpdateUserSuccessState) {
              MyProgressIndicator.dismiss(context);
              currentUser?.userEmail = state.user.userEmail;
              currentUser?.userDisplayNme = state.user.userDisplayNme;
              MySnackBar.show(
                context: context,
                title: AppLocalization.of(context).getTranslatedValue('success'),
                message: AppLocalization.of(context).getTranslatedValue('user_update_success'),
                type: SnackBarType.success,);
            }
            if (state is UpdateUserFailedState) {
              MyProgressIndicator.dismiss(context);
              MySnackBar.show(
                context: context,
                title: AppLocalization.of(context).getTranslatedValue('failed'),
                message: state.message,
                type: SnackBarType.error,);
            }
          },
          builder: (context, state) {
            return Align(
              alignment: Alignment.center,
              child: ListView(
                // shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                children: [

                  Center(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: InkWell(
                            onTap: (){},
                            child: SizedBox(
                              height: 120,
                              width: 120,
                              child: CachedNetworkImage(
                                imageUrl: 'https://static.wikia.nocookie.net/rdr/images/2/2f/Arthur_Morgan.jpg/revision/latest?cb=20190108180248&path-prefix=es',
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const Center(child: SizedBox(height: 20, width: 20, child: CircularProgressIndicator())),
                                errorWidget: (context, url, error) => const Icon(Icons.error, size: 20,),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20,),

                        Text(currentUser?.userDisplayNme ?? '', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                        Text(currentUser?.userEmail ?? '', style: TextStyle(fontSize: 15, color: Color(0xFF535353)),),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20,),

                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Column(
                        children: [
                          _listTileItem(
                            context,
                            'assets/icons/person.png',
                            'accounts',
                            [

                              _accountItem(AppLocalization.of(context).getTranslatedValue('email'), _emailTextController, 'youremail@xmail.com'),

                              _accountItem(AppLocalization.of(context).getTranslatedValue('full_name'), _nameTextController, 'William Bennet'),

                              _accountItem(AppLocalization.of(context).getTranslatedValue('street_address'), _addressTextController, '465 Nolan Causeway Suite 079'),

                              _accountItem(AppLocalization.of(context).getTranslatedValue('apt_suite_bldg'), _houseTextController, 'Unit 512'),

                              Align(alignment: Alignment.centerLeft, child: SizedBox(width: 90, child: _accountItem(AppLocalization.of(context).getTranslatedValue('zip_code'), _zipTextController, '77017'))),

                              SizedBox(height: 20,),

                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          padding: const EdgeInsets.symmetric(vertical: 20),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                      ),
                                      child: Text(AppLocalization.of(context).getTranslatedValue('cancel'), style: const TextStyle(fontSize: 17, color: Color(0xFF818995)),),
                                    ),
                                  ),

                                  const SizedBox(width: 20,),

                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        context.read<AuthBloc>().add(OnUpdateUserEvent(name: _nameTextController.text, email: _emailTextController.text));
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(0xFF1ABC9C),
                                          padding: const EdgeInsets.symmetric(vertical: 20),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                      ),
                                      child: Text(AppLocalization.of(context).getTranslatedValue('save'), style: const TextStyle(fontSize: 17, color: Colors.white),),
                                    ),
                                  )
                                ],
                              ),

                              SizedBox(height: 20,),
                            ],
                          ),

                          const Divider(thickness: 1.5, color: Color(0xFFD8D8D8),),

                          Form(
                            key: _passwordFormKey,
                            child: _listTileItem(context, 'assets/icons/password.png', 'password', [

                              TextInputField(
                                controller: _passwordTextController,
                                hint: AppLocalization.of(context).getTranslatedValue('password'),
                                validator: (value) {
                                  if(value == null || value.isEmpty) return AppLocalization.of(context).getTranslatedValue('this_field_cannot_empty');
                                  return null;
                                },
                              ),

                              const SizedBox(height: 20,),

                              TextInputField(
                                controller: _confirmPassTextController,
                                hint: AppLocalization.of(context).getTranslatedValue('confirm_password'),
                                validator: (value) {
                                  if(value == null || value.isEmpty) return AppLocalization.of(context).getTranslatedValue('this_field_cannot_empty');
                                  if(value != _passwordTextController.text) return AppLocalization.of(context).getTranslatedValue('password_not_matched');
                                  return null;
                                },
                              ),

                              SizedBox(height: 20,),

                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          padding: const EdgeInsets.symmetric(vertical: 20),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                      ),
                                      child: Text(AppLocalization.of(context).getTranslatedValue('cancel'), style: const TextStyle(fontSize: 17, color: Color(0xFF818995)),),
                                    ),
                                  ),

                                  const SizedBox(width: 20,),

                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if(_passwordFormKey.currentState!.validate()) {
                                          context.read<AuthBloc>().add(OnUpdateUserEvent(name: _nameTextController.text, email: _emailTextController.text));
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(0xFF1ABC9C),
                                          padding: const EdgeInsets.symmetric(vertical: 20),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                      ),
                                      child: Text(AppLocalization.of(context).getTranslatedValue('save'), style: const TextStyle(fontSize: 17, color: Colors.white),),
                                    ),
                                  )
                                ],
                              ),

                              SizedBox(height: 20,),

                            ],),
                          ),

                          const Divider(thickness: 1.5, color: Color(0xFFD8D8D8),),

                          _listTileItem(context, 'assets/icons/notification.png', 'notification', []),

                          const Divider(thickness: 1.5, color: Color(0xFFD8D8D8),),

                          _listTileItem(context, 'assets/icons/heart.png', 'wishlist', []),

                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 60,),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _listTileItem(BuildContext context, String leadingIcon, String title, List<Widget> children) {
    return BlocProvider(
      create: (context) => TrailingIconCubit(),
      child: BlocBuilder<TrailingIconCubit, bool>(
        builder: (context, state) {
          return Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ListTileTheme(
              contentPadding: const EdgeInsets.symmetric(horizontal: 0),
              horizontalTitleGap: 0,
              child: ExpansionTile(
                leading: Image.asset(leadingIcon, color: Color(0xFF7C8592),),
                title: Text(AppLocalization.of(context).getTranslatedValue(title), style: const TextStyle(fontSize: 17),),
                trailing: Icon(state ? Icons.expand_more : Icons.keyboard_arrow_right_outlined),
                onExpansionChanged: (isExpanded) {
                  context.read<TrailingIconCubit>().toggleIcon();
                },
                children: children,
              ),
            ),
          );
        }
      ),
    );
  }

  Widget _accountItem(String title, TextEditingController textController, String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(title, style: TextStyle(fontSize: 16, color: Color(0xFF263238)),),

          SizedBox(height: 10,),

          TextInputField(
            controller: textController,
            hint: hint,
            borderColor: true,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}