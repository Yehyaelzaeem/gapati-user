import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/global/styles/colors.dart';
import '../../data/model/response/item_extra_model.dart';

class MultiSelectChip extends StatefulWidget {
  final List<ItemExtraModelData> reportList;
  final Function(List<ItemExtraModelData>) onSelectionChanged;
  final List<ItemExtraModelData>? initialSelection;
  final double? height;
  final double? width;
  final double? horizontal;
  final double? vertical;
  final double? radius;
  final double? paddingTop;
  const MultiSelectChip(
       {
        super.key,
        required this.reportList,
        required this.onSelectionChanged,
        this.initialSelection, this.height, this.width, this.horizontal,
         this.vertical, this.radius, this.paddingTop,
      });

  @override
  // ignore: library_private_types_in_public_api
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  List<ItemExtraModelData> selectedChoices = [];

  @override
  void initState() {
    super.initState();
    if (widget.initialSelection != null) {
      // selectedChoices.addAll(widget.initialSelection!);
      selectedChoices=widget.initialSelection!;
    }
  }

  _buildChoiceList() {
    List<Widget> choices = [];
    for (var item in widget.reportList) {
      choices.add(
          Stack(
            children: [
              Container(
                child: Padding(
                  padding:  EdgeInsets.only(top:widget.paddingTop?? 17.h),
                  child: Container(
                    width: widget.width,
                    height: widget.height,
                          padding: EdgeInsets.symmetric(horizontal: widget.horizontal?? 5.w, vertical: widget.vertical??4.h),
                          child: FittedBox(
                  child: ChoiceChip(
                    side: BorderSide(color: Colors.transparent),
                    avatar: Icon(Icons.crop_square, color: selectedChoices.contains(item) ? AppColors.whiteColor : AppColors.primaryColor),
                    label: Text(item.name!,style: TextStyle(color: selectedChoices.contains(item) ? AppColors.whiteColor : AppColors.primaryColor,
                     fontWeight: FontWeight.w700, fontSize: 16.sp
                    )),
                    selectedColor: AppColors.primaryColor,
                    disabledColor: AppColors.customGray,
                    selected: selectedChoices.contains(item),
                    onSelected: (selected) {
                      setState(() {
                        if (selectedChoices.contains(item)) {
                          selectedChoices.remove(item);
                        } else {
                          selectedChoices.add(item);
                        }

                        // if (selectedChoices.isNotEmpty) {
                        //   widget.onSelectionChanged(selectedChoices);
                        // }
                        widget.onSelectionChanged(selectedChoices);



                      });
                    },
                  ),
                          ),
                        ),
                ),
              ),
              Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: selectedChoices.contains(item) ? AppColors.secondPrimaryColor:AppColors.whiteColor ,
                    radius:widget.radius?? 18,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FittedBox(child: Text(double.parse(item.price.toString()).toStringAsFixed(1),
                        style: TextStyle(
                            color: selectedChoices.contains(item) ? AppColors.whiteColor : AppColors.tireColor1,
                            fontWeight: FontWeight.bold,
                            fontSize: 10.sp
                        ),
                      )),
                    ),
                  )),

            ],
          ));
    }
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.initialSelection != null) {
      selectedChoices=widget.initialSelection!;
    }
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}