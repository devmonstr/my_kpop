import 'package:flutter/material.dart';
import 'package:my_kpop/providers/user_provider.dart';
import 'package:provider/provider.dart';

class DisplayNameWidget extends StatelessWidget {
  const DisplayNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return ListTile(
      leading: const Icon(Icons.title),
      title: const Text("Display name"),
      trailing: Text(userProvider.user.displayName),
      onTap: () => _showDisplayNameDialog(context),
    );
  }

  void _showDisplayNameDialog(BuildContext context) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("Display name"),
            content: TextFormField(
              controller: controller,
              decoration: const InputDecoration(hintText: 'display name'),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  if (controller.text.isNotEmpty) {
                    Provider.of<UserProvider>(
                      context,
                      listen: false,
                    ).updateDisplayName(controller.text);
                  }
                  Navigator.pop(context);
                },
                child: const Text("Save"),
              ),
            ],
          ),
    );
  }
}
