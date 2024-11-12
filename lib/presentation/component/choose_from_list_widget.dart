import 'dart:async';
import 'package:delivego/generated/locale_keys.g.dart';
import 'package:delivego/presentation/component/texts/black_texts.dart';
import 'package:delivego/presentation/component/texts/hint_texts.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/helpers/spacing.dart';
import '../../core/resources/color.dart';

class ChooseFromListItemWidget extends StatefulWidget {
  final List<ChooseItemListModel> items;
  final double? radius;
  final double? width;
  final ChooseItemListModel? initialSelection;
  final double? height;
  final Function(ChooseItemListModel item)? onChoose;
  ChooseFromListItemWidget({
    super.key,
    this.width,
    this.onChoose,
    this.height,
    this.radius,
    required this.items, this.initialSelection,
  });

  @override
  _ChooseFromListItemWidgetState createState() => _ChooseFromListItemWidgetState();
}

class _ChooseFromListItemWidgetState extends State<ChooseFromListItemWidget> {
  final StreamController<ChooseItemListModel> _controller = StreamController<ChooseItemListModel>();
  late ChooseItemListModel selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem =widget.initialSelection?? widget.items.first;
    _controller.add(selectedItem); // إضافة العنصر المحدد إلى الـ Stream
  }

  @override
  void dispose() {
    _controller.close(); // إغلاق الـ Stream عند الانتهاء
    super.dispose();
  }

  void _chooseItem(ChooseItemListModel item) {
    setState(() {
      selectedItem = item;
    });
    _controller.add(item); // إرسال العنصر المختار إلى الـ Stream
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ChooseItemListModel>(
      stream: _controller.stream,
      builder: (context, snapshot) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ...widget.items.map((e) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: InkWell(
                  onTap: () {
                    widget.onChoose?.call(e);
                    _chooseItem(e);

                  },
                  child: Center(
                    child: Container(
                      height: widget.height,
                      width: widget.width,
                      decoration: BoxDecoration(
                        color: selectedItem.title == e.title ? primaryColor : null,
                        border: Border.all(
                          color: selectedItem.title == e.title ? primaryColor : Colors.grey.shade300,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(widget.radius ?? 12),
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w) + EdgeInsets.only(top: 4.h),
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    BlackBoldText(
                                      labelColor: selectedItem.title == e.title ? Colors.grey.shade300 : Colors.grey.shade700,
                                      label: '${LocaleKeys.size.tr()} :',
                                      fontSize: 11.sp,
                                    ),
                                    horizontalSpace(5),
                                    HintSemiBoldText(
                                      labelColor: selectedItem.title == e.title ? Colors.white : Colors.grey.shade500,
                                      label: '${e.title}',
                                      fontSize: 13.sp,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    BlackBoldText(
                                      labelColor: selectedItem.title == e.title ? Colors.grey.shade300 : Colors.grey.shade700,
                                      label: '${LocaleKeys.price.tr()} :',
                                      fontSize: 11.sp,
                                    ),
                                    horizontalSpace(5),
                                    HintSemiBoldText(
                                      labelColor: selectedItem.title == e.title ? Colors.white : Colors.grey.shade500,
                                      label: '${e.value}',
                                      fontSize: 13.sp,
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.circle,
                                color: selectedItem.title == e.title ? Colors.white : Colors.transparent,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )),
            ],
          ),
        );
      },
    );
  }
}

class ChooseItemListModel {
  final int id;
  final String title;
  final String value;
  final String value2;

  ChooseItemListModel({required this.id, required this.title, required this.value, required this.value2});
}
