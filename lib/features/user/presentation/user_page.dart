import 'package:flutter/material.dart';
import 'package:base_flutter_2/core/presentation/base_page.dart';
import 'package:go_router/go_router.dart';
import 'cubit/user_cubit.dart';
import 'cubit/user_state.dart';
import 'widgets/user_card.dart';

import '../../../app/routing/app_pages.dart';

class UserPage extends BasePage<UserCubit, UserState> {
  static final route = GoRoute(
    path: AppPages.userPath,
    name: AppPages.userName,
    builder: (context, state) => const UserPage(),
  );

  const UserPage({super.key});

  @override
  void onInit(BuildContext context, UserCubit cubit) => cubit.fetchUser();

  @override
  Color? get backgroundColor => const Color(0xFFF8F9FA);

  @override
  EdgeInsetsGeometry get contentPadding => const EdgeInsets.all(20);

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Hồ sơ người dùng',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.black,
    );
  }

  @override
  VoidCallback? retryAction(BuildContext context, UserCubit cubit) {
    return cubit.fetchUser;
  }

  @override
  Widget buildSuccess(BuildContext context, UserState state) {
    return Column(
      children: [
        if (state.user != null) UserCard(user: state.user!),
        const SizedBox(height: 24),
        const ListTile(
          leading: Icon(Icons.settings_outlined),
          title: Text('Cài đặt tài khoản'),
          trailing: Icon(Icons.chevron_right),
        ),
        const ListTile(
          leading: Icon(Icons.help_outline),
          title: Text('Trợ giúp & Phản hồi'),
          trailing: Icon(Icons.chevron_right),
        ),
      ],
    );
  }
}
