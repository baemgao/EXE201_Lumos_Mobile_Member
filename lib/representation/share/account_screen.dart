import 'package:flutter/material.dart';
import 'package:exe201_lumos_mobile/component/app_bar.dart';
import 'package:exe201_lumos_mobile/component/my_button.dart';
import 'package:exe201_lumos_mobile/component/my_button_list.dart';
import 'package:exe201_lumos_mobile/core/const/color_const.dart';
import 'package:exe201_lumos_mobile/core/const/lumos_icons.dart';
import 'package:exe201_lumos_mobile/core/helper/asset_helper.dart';
import 'package:exe201_lumos_mobile/representation/share/about_lumos.dart';
import 'package:exe201_lumos_mobile/representation/share/account_update.dart';
import 'package:exe201_lumos_mobile/representation/share/bill_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  static String routeName = '/account_screen';

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCom(
        appBarText: 'Tài khoản',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 28),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(AssetHelper.accountImg),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildAccountInfo(), // Extracted account info section
                    const SizedBox(height: 34),
                    _buildButtonList(
                      text: 'Hóa đơn',
                      leftIcon: Icons.credit_card,
                      rightIcon: Icons.arrow_forward_ios,
                      onPressed: () {
                        Navigator.of(context).pushNamed(BillScreen.routeName);
                      },
                    ),
                    const SizedBox(height: 34),
                    _buildButtonList(
                      text: 'Đặt chỗ',
                      leftIcon: Icons.calendar_month_outlined,
                      rightIcon: Icons.arrow_forward_ios,
                      onPressed: () {
                        // Navigate to reservation screen
                      },
                    ),
                    const SizedBox(height: 34),
                    _buildButtonList(
                      text: 'Về Lumos',
                      leftIcon: LumosIcons.hearticon,
                      rightIcon: Icons.arrow_forward_ios,
                      onPressed: () {
                        Navigator.of(context).pushNamed(AboutUs.routeName);
                      },
                    ),
                    const SizedBox(height: 42),
                    MyButton(
                      onTap: () {
                        //
                      },
                      text: 'Đăng xuất',
                      color: ColorPalette.blueBold2,
                      borderRadius: 66.50,
                      widget: const Text(
                        'Đăng xuất',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorPalette.secondaryWhite,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 3),
                    const SizedBox(
                      height: 55,
                      child: Center(
                        child: Text(
                          '© All copyright of Lumos',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: ColorPalette.blueBold2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Leslie Alexander',
          style: TextStyle(
            color: ColorPalette.blueBold2,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 3),
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(UpdateAccount.routeName);
          },
          icon: const Icon(
            LumosIcons.edit_2icon,
            color: ColorPalette.blueBold2,
          ),
        ),
      ],
    );
  }

  Widget _buildButtonList({
    required String text,
    required IconData leftIcon,
    required IconData rightIcon,
    required VoidCallback onPressed,
  }) {
    return MyButtonList(
      text: text,
      leftIcon: leftIcon,
      rightIcon: rightIcon,
      onPressed: onPressed,
    );
  }
}
