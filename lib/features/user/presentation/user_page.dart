import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'cubit/user_cubit.dart';
import 'cubit/user_state.dart';
import 'widgets/user_card.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<UserCubit>()..fetchUser(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),
        appBar: AppBar(
          title: const Text(
            'Hồ sơ người dùng',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
        ),
        body: const UserView(),
      ),
    );
  }
}

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: switch (state.status) {
              UserStatus.initial || UserStatus.loading => const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              UserStatus.failure => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error_outline, size: 60, color: Colors.redAccent),
                      const SizedBox(height: 16),
                      Text(
                        state.errorMessage ?? 'Đã có lỗi xảy ra',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton.icon(
                        onPressed: () => context.read<UserCubit>().fetchUser(),
                        icon: const Icon(Icons.refresh),
                        label: const Text('Thử lại'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ],
                  ),
                ),
              UserStatus.success => Column(
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
                ),
            },
          ),
        );
      },
    );
  }
}
