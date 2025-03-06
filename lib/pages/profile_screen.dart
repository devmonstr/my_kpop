import 'package:flutter/material.dart';
import 'package:my_kpop/widgets/avatar_widget.dart';
import 'package:my_kpop/widgets/display_name_widget.dart';
import 'package:my_kpop/widgets/language_widget.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        if (!userProvider.isInitialized) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text("Profile"),
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          body: ListView(
            children: const [
              AvatarWidget(),
              DisplayNameWidget(),
              LanguageWidget(),
            ],
          ),
        );
      },
    );
  }
}
