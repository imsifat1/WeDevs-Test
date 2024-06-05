import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedev_test/pages/bloc/trailing_icon_cubit.dart';

import '../../../barrel/widgets.dart';
import '../../../localization/app_localization.dart';

class AccountPage extends StatelessWidget {
  AccountPage({Key? key}) : super(key: key);

  final _emailTextController = TextEditingController();
  final _nameTextController = TextEditingController();
  final _addressTextController = TextEditingController();
  final _houseTextController = TextEditingController();
  final _zipTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: AppLocalization.of(context).getTranslatedValue('my_account'),
        backButtonEnabled: false,
      ),

      body: Align(
        alignment: Alignment.center,
        child: ListView(
          // shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: [

            Center(
              child: Column(
                children: [
                  InkWell(
                    onTap: (){},
                    child: Image.asset('assets/images/profile.png'),
                  ),

                  // const SizedBox(height: 20,),

                  const Text('John Smith', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                  const Text('info@johnsmith.com', style: TextStyle(fontSize: 15, color: Color(0xFF535353)),),
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
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF1ABC9C),
                                    padding: const EdgeInsets.symmetric(vertical: 20),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                ),
                                child: Text(AppLocalization.of(context).getTranslatedValue('save'), style: const TextStyle(fontSize: 17,),),
                              ),
                            )
                          ],
                        ),

                        SizedBox(height: 20,),
                      ],
                    ),

                    const Divider(thickness: 1.5, color: Color(0xFFD8D8D8),),

                    _listTileItem(context, 'assets/icons/password.png', 'password', []),

                    const Divider(thickness: 1.5, color: Color(0xFFD8D8D8),),

                    _listTileItem(context, 'assets/icons/notification.png', 'notification', []),

                    const Divider(thickness: 1.5, color: Color(0xFFD8D8D8),),

                    _listTileItem(context, 'assets/icons/heart.png', 'wishlist', []),
                  ],
                ),
              ),
            )

          ],
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
            child: ExpansionTile(
              leading: Image.asset(leadingIcon),
              title: Text(AppLocalization.of(context).getTranslatedValue(title), style: const TextStyle(fontSize: 17),),
              tilePadding: const EdgeInsets.symmetric(horizontal: 0),
              trailing: Icon(state ? Icons.expand_more : Icons.keyboard_arrow_right_outlined),
              onExpansionChanged: (isExpanded) {
                context.read<TrailingIconCubit>().toggleIcon();
              },
              children: children,
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
