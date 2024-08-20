
import 'package:delivego/core/helpers/extensions.dart';
import 'package:flutter/material.dart';

import '../../../core/global/styles/colors.dart';

void customShowDialog({required String title, required String body, required void Function()? onPressed,required BuildContext context}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title:  Text(title),
        content:  SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(body),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Colors.grey, disabledForegroundColor: Colors.grey.withOpacity(0.38),
            ),
            onPressed: () {
              context.pop();
            },
            child: const Text('Exit'),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: AppColors.primaryColor.withOpacity(0.70), disabledForegroundColor: Colors.grey.withOpacity(0.38),
            ),
            onPressed:onPressed,
            child: const Text('Agree'),
          ),

        ],
      );
    },
  );
}