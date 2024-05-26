import 'package:cogina/core/helpers/extensions.dart';
import 'package:cogina/core/routing/routes.dart';
import 'package:cogina/presentation/modules/layout/screens/more/profile/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/global/styles/colors.dart';
import '../../../../../core/global/styles/styles.dart';
import '../../../../../core/helpers/my_date_util.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/resources/color.dart';
import '../../../../../data/model/response/chat_user.dart';
import '../../../../../data/model/response/message_model.dart';
import '../../../../component/images/custom_image.dart';
import '../../../../component/texts/black_texts.dart';
import '../../../../component/texts/hint_texts.dart';
import '../../cubit/chat_cubit.dart';


class ChatItemWidget extends StatelessWidget {
  final ChatUser chatUser;
   ChatItemWidget({super.key, required this.chatUser});
   int x =0;
   List<Message>? list;
  @override
  Widget build(BuildContext context) {
    ChatCubit cubit =ChatCubit.get();
    Message? message;
    return   StreamBuilder(
      stream: cubit.getLastMessage(chatUser),
      builder: ( context,  snapshot) {
        switch (snapshot.connectionState)
        {
        //if data is loading
          case ConnectionState.waiting:
          case ConnectionState.none:
          // return const Center(
          //     child: CircularProgressIndicator());

          //if some or all data is loaded then show it
          case ConnectionState.active:
          case ConnectionState.done:
          final data = snapshot.data?.docs;
          list = data?.map((e) => Message.fromJson(e.data())).toList() ?? [];
          if (list!=null&&list!.isNotEmpty){
            message= list![0];
            cubit.getUnreadMessagesCount(chatUser.id);
          }
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: (){
                context.pushNamed(RoutesRestaurants.chatRoomScreen,arguments: {'user':chatUser});
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // color: whiteColor,
                  // boxShadow: const [BoxShadow(color: Colors.black26,blurRadius: 2)]
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
                  child:
                  Row(
                    children: [
                      CustomImage(
                        height: 60.h,
                        width: 60.h,
                        image: chatUser.image??'',radius: 50,),
                      horizontalSpace(15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                BlackBoldText(
                                  label: chatUser.name??'',
                                  fontSize: 18,
                                  labelColor: AppColors.backBlue2,
                                ),
                                const Spacer(),
                                Text(
                                  MyDateUtil.getLastMessageTime(
                                      context: context, time: message?.sentTime??''),
                                  style: const TextStyle(color: Colors.black54),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                HintRegularText(
                                  label:  message != null
                                      ? message!.type == Type.image
                                      ? 'image'
                                      : message!.msg
                                      : chatUser.about,
                                  maxLines: 1,
                                  labelStyle: TextStyles.font14CustomGray400Weight.copyWith(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),

                                ),
                                const Spacer(),

                                if(message!=null &&message!.read.isEmpty&&message!.fromId.toString()!=ProfileCubit.get(context).profileModel!.id!.toString())
                                  Padding(
                                      padding: EdgeInsets.only(left: 15.w,right: 15.w),
                                      child: CircleAvatar(
                                        radius: 10,
                                        backgroundColor: primaryColor,
                                        child:  Center(
                                          child: Text(cubit.countMessage.toString(),
                                            style: const TextStyle(color: AppColors.whiteColor,fontSize: 12),
                                          ),
                                        ),
                                      )
                                  ),
                               if(message!=null &&message!.read.isNotEmpty)
                                 const Icon(Icons.done_all_rounded, color: Colors.blue, size: 20)
                               else
                                 const Icon(Icons.done, color: Colors.grey, size: 20)


                              ],
                            ),
                          ],
                        ),
                      ),
                      horizontalSpace(10),
                    ],
                  ),
                ),
              ),
            ),
          );

        }
      },
    );
  }
}
