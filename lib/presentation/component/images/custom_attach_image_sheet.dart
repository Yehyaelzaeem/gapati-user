import 'package:delivego/core/resources/text_styles.dart';
import 'package:delivego/presentation/component/texts/black_texts.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/routing/navigation_services.dart';
import '../../../generated/locale_keys.g.dart';



class _CustomAttachImageSheet extends StatefulWidget {
  final ValueChanged<String> _onAttachImage;


  @override
  State<_CustomAttachImageSheet> createState() => __CustomAttachImageSheetState();

  const _CustomAttachImageSheet({Key? key,
    required ValueChanged<String> onAttachImage,
  }) : _onAttachImage = onAttachImage, super(key: key);
}

class __CustomAttachImageSheetState extends State<_CustomAttachImageSheet> {
  final pickerQu = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      // height: 180.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.photo_library),
            title:
            BlackBoldText(
              label: tr(LocaleKeys.gallery),
              fontSize: 14,
            ),
            onTap: _fromGallery,
          ),
          ListTile(
            leading: const Icon(Icons.photo_camera),
            title:
            BlackBoldText(
              label: tr(LocaleKeys.camera),
              fontSize: 14,
            ),
            onTap: _takesPhoto,
          ),
        ],
      ),
    );
  }

  _takesPhoto() async {
    final pickedFile = await pickerQu.pickImage(source: ImageSource.camera);
    if (pickedFile!=null) {
      NavigationService.goBack();
      widget._onAttachImage(pickedFile.path);
    }
  }

  Future<dynamic> _fromGallery() async {
    final pickedFile = await pickerQu.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      NavigationService.goBack();
      widget._onAttachImage(pickedFile.path);
    }
  }

}

showSelectAttachChatMethods(BuildContext context,{ required ValueChanged<String> onAttachImage}){
  FocusScope.of(context).unfocus();

  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return _CustomAttachImageSheet(onAttachImage: onAttachImage);
      });
}