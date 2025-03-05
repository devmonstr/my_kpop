import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_kpop/providers/user_provider.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
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
            title: const Text('Dashboard'),
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              IconButton(
                onPressed: () {
                  context.push('/profile');
                },
                icon: const Icon(Icons.settings),
              ),
            ],
          ),
          body: Center(
            child: Column(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                userProvider.user.avatarPath == "none"
                    ? const CircleAvatar(radius: 60)
                    : CircleAvatar(
                      radius: 60,
                      backgroundImage: FileImage(
                        File(userProvider.user.avatarPath),
                      ),
                    ),
                Text(
                  'Name: ${userProvider.user.displayName}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  'Language: ${userProvider.user.language}',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
