import 'package:flutter/material.dart';
import 'package:my_kpop/providers/user_provider.dart';
import 'package:provider/provider.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return ListTile(
      leading: const Icon(Icons.language),
      title: const Text("Language"),
      trailing: Text(userProvider.user.language),
      onTap: () => _showLanguageDialog(context),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("Language"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () {
                    Provider.of<UserProvider>(
                      context,
                      listen: false,
                    ).updateLanguage("English");
                    Navigator.pop(context);
                  },
                  child: const Text("English"),
                ),
                TextButton(
                  onPressed: () {
                    Provider.of<UserProvider>(
                      context,
                      listen: false,
                    ).updateLanguage("Thai");
                    Navigator.pop(context);
                  },
                  child: const Text("Thai"),
                ),
              ],
            ),
          ),
    );
  }
}
