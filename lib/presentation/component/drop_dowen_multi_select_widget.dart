import 'dart:async';
import 'package:delivego/core/global/fonts/app_fonts.dart';
import 'package:delivego/generated/locale_keys.g.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropdownMultiSelectWidget extends StatefulWidget {
  final void Function(List<DropDownItemData>)? selectedItems;
  final String? hint;
  final double? radius;
  final List<DropDownItemData> items;
  final List<DropDownItemData> itemsInitialSelection;

  const DropdownMultiSelectWidget({
    super.key,
    required this.selectedItems,
    this.radius,
    this.hint,
    required this.items,
    required this.itemsInitialSelection,
  });

  @override
  State<DropdownMultiSelectWidget> createState() => _DropdownMultiSelectWidgetState();
}

class _DropdownMultiSelectWidgetState extends State<DropdownMultiSelectWidget> {
  List<DropDownItemData> listData = [];
  TextEditingController controller = TextEditingController();
  final StreamController<List<DropDownItemData>> _selectedItemsController = StreamController<List<DropDownItemData>>.broadcast();

  @override
  void initState() {
    super.initState();
    if (widget.itemsInitialSelection.isNotEmpty) {
      listData = widget.itemsInitialSelection;
      _selectedItemsController.sink.add(listData); // أضف الحالة الابتدائية إلى الـ Stream
    }
  }

  @override
  void dispose() {
    _selectedItemsController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                hint: Text(widget.hint ?? 'Select items'),
                items: widget.items.map((DropDownItemData item) {
                  return DropdownMenuItem<DropDownItemData>(
                    value: item,
                    child:
                   StatefulBuilder(builder: (context, setState) {
                     return  InkWell(
                       onTap: () {
                         setState(() {
                           if (listData.contains(item)) {
                             listData.remove(item);
                           } else {
                             listData.add(item);
                           }

                         });
                         _selectedItemsController.sink.add(listData); // إرسال التحديثات إلى الـ Stream
                         widget.selectedItems!(listData); // تحديث العناصر المختارة
                       },
                       child: Row(
                         children: [
                           Checkbox(
                             value: listData.contains(item),
                             onChanged: (bool? isChecked) {
                               setState(() {
                                 if (isChecked ?? false) {
                                   listData.add(item);
                                 } else {
                                   listData.remove(item);
                                 }
                                 _selectedItemsController.sink.add(listData); // إرسال التحديثات إلى الـ Stream
                                 widget.selectedItems!(listData); // تحديث العناصر المختارة
                               });
                             },
                           ),
                           Text(item.title,
                           style: TextStyle(
                             fontFamily: AppFonts.lateefFont
                           ),),
                           Spacer(),
                           Text('${item.value} ${LocaleKeys.lyd.tr()}',
                             style: TextStyle(
                                 fontFamily: AppFonts.lateefFont
                             ),
                           ),
                         ],
                       ),
                     );
                   })
                  );
                }).toList(),
                onChanged: (_) {},
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 200.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                iconStyleData: IconStyleData(
                  icon: const Icon(Icons.keyboard_arrow_down),
                ),
                buttonStyleData: ButtonStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(widget.radius??12.r),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 5.h),
        StreamBuilder<List<DropDownItemData>>(
          stream: _selectedItemsController.stream,
          initialData: listData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Wrap(
                children: snapshot.data!.map((e) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Chip(
                      label: Text(e.title,
                      style: TextStyle(
                        fontFamily: AppFonts.lateefFont,
                        fontSize: 16.sp,
                      ),
                      ),
                      onDeleted: () {
                        setState(() {
                          listData.remove(e);
                          _selectedItemsController.sink.add(listData); // إرسال التحديثات إلى الـ Stream
                          widget.selectedItems!(listData);
                        });
                      },
                    ),
                  );
                }).toList(),
              );
            } else {
              return Container(); // عرض فارغ في حالة عدم وجود بيانات
            }
          },
        ),
      ],
    );
  }
}

class DropDownItemData {
  final String id;
  final String title;
  final String value;

  DropDownItemData({required this.id, required this.title, required this.value});
}
