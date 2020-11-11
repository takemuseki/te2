import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:te2/main.dart';
import 'package:te2/process/4_app_process/material_app_model.dart';
import 'package:te2/screens/6_2_mailbox_screen/mailbox_model.dart';
import 'package:te2/screens/6_2_mailbox_screen/mailbox_view.dart';

class MailboxSetup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => MailboxModel(
        uid: context.read<MaterialAppModel>().uid,
        fireStorageService: context.read<MyAppModel>().fireStorageService,
        firestoreService: context.read<MyAppModel>().firestoreService,
      ),
      builder: (context, child) {
        return MailboxView();
      },
    );
  }
}
