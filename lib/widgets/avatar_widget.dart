import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:my_kpop/providers/user_provider.dart';
import 'package:provider/provider.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Center(
            child: SizedBox(
              width: 120,
              height: 120,
              child: Stack(
                children: [
                  userProvider.user.avatarPath == "none"
                      ? const CircleAvatar(radius: 60)
                      : CircleAvatar(
                        radius: 60,
                        backgroundImage: FileImage(
                          File(userProvider.user.avatarPath),
                        ),
                      ),
                  Align(
                    alignment: Alignment.center,

                    child: IconButton(
                      onPressed: () async {
                        final file = await FilePicker.platform.pickFiles(
                          allowMultiple: false,
                        );
                        if (file != null) {
                          userProvider.updateAvatar(file.paths.first!);
                        }
                      },
                      icon: const Icon(
                        Icons.add_a_photo_outlined,
                        color: Colors.white,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: Color.fromRGBO(0, 0, 0, 100),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              userProvider.user.displayName,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ],
      ),
    );
  }
}
