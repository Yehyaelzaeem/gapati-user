import 'package:cogina/core/global/styles/styles.dart';
import 'package:cogina/core/helpers/spacing.dart';
import 'package:cogina/presentation/component/component.dart';
import 'package:flutter/material.dart';

import '../../../../core/global/styles/colors.dart';
import '../../component/custom_text_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Search',
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [BoxShadow(color: Colors.black12,blurRadius: 1,
                      offset: Offset(2,3)
                  )]
              ),
              width: MediaQuery.of(context).size.width*0.9,
              child: CustomTextField(
                hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                fillColor: AppColors.whiteColor.withOpacity(0.6),
                borderColor: AppColors.whiteColor.withOpacity(0.0),
                borderRadius: 12,
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search',
                hintColor: AppColors.black,
                controller: TextEditingController(),),
            ),
          ),
          verticalSpace(150),
          Text('What do you want to search for?',
          style: TextStyles.font20Black700Weight.copyWith(
            color: AppColors.customGray
          ),
          )
        ],
      ) ,
    );
  }
}
