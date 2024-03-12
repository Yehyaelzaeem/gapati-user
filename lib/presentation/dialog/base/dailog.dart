import 'package:cogina/core/global/styles/colors.dart';
import 'package:cogina/core/helpers/extensions.dart';
import 'package:flutter/material.dart';

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
              primary: Colors.white,
              backgroundColor: Colors.grey,
              onSurface: Colors.grey,
            ),
            onPressed: () {
              context.pop();
            },
            child: const Text('Exit'),
          ),
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: AppColors.primaryColor.withOpacity(0.70),
              onSurface: Colors.grey,
            ),
            onPressed:onPressed,
            child: const Text('Agree'),
          ),

        ],
      );
    },
  );
}