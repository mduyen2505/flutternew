import 'package:flutter/material.dart';

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({super.key});

  void _showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Account'),
          content: const Text(
            'You need to contact our Admin team or visit the HDTech center for account deletion assistance.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).pop(); // Close the DeleteAccount screen
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Show the dialog as soon as this widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showDeleteAccountDialog(context);
    });

    // Returning an empty container since we only need the dialog
    return Container();
  }
}
