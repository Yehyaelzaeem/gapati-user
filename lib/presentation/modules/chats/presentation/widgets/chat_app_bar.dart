import 'package:cached_network_image/cached_network_image.dart';
import 'package:cogina/core/global/styles/colors.dart';
import 'package:cogina/presentation/modules/chats/presentation/widgets/user_details_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/helpers/my_date_util.dart';
import '../../../../../data/model/response/chat_user.dart';
import '../../cubit/chat_cubit.dart';

class ChatAppBarWidget extends StatelessWidget {
  final ChatUser user;
  const ChatAppBarWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    ChatCubit cubit =ChatCubit.get();
    var mq =MediaQuery.of(context).size;
    return SafeArea(
      child: StreamBuilder(
          stream: cubit.getUserInfo(user),
          builder: (context, snapshot) {
            final data = snapshot.data?.docs;
            final list = data?.map((e) => ChatUser.fromJson(e.data())).toList() ?? [];
            return InkWell(
              onTap: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    UserDetails userDetails =UserDetails(
                        image: user.image??'', name: user.name??'',
                        phone: user.phone??'',
                     status:   list.isNotEmpty
                         ? list[0].isOnline
                         ? 'Online'
                         : MyDateUtil.getLastActiveTime(
                         context: context,
                         lastActive: list[0].lastActive)
                         : MyDateUtil.getLastActiveTime(
                         context: context,
                         lastActive: user.lastActive),
                    );
                    return AlertDialog(
                      contentPadding: EdgeInsets.zero,
                      backgroundColor: AppColors.whiteColor,
                      shadowColor:AppColors.whiteColor,
                      content: UserDetailsWidget(userDetails: userDetails),
                      // actions: <Widget>[
                      //   TextButton(
                      //     onPressed: () {
                      //       Navigator.pop(context);
                      //     },
                      //     child: const Text('Close'),
                      //   ),
                      // ],
                    );                  },
                );
              },
              child: Row(
                children: [
                  //back button
                  IconButton(
                      onPressed: ()  {
                        Navigator.pop(context);
                        cubit.getChatRoomName('');
                      },
                      icon: const Icon(Icons.arrow_back_ios_rounded,
                          color: Colors.black54)),

                  //user profile picture
                  Hero(
                    tag: user.image,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(mq.height * .03),
                      child: CachedNetworkImage(
                        width: mq.height * .05,
                        height: mq.height * .05,
                        fit: BoxFit.cover,
                        imageUrl:
                        list.isNotEmpty ? list[0].image : user.image,
                        errorWidget: (context, url, error) =>
                        const CircleAvatar(
                            child: Icon(CupertinoIcons.person)),
                      ),
                    ),
                  ),

                  //for adding some space
                  const SizedBox(width: 10),

                  //user name & last seen time
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //user name
                      Text(list.isNotEmpty ? list[0].name : user.name,
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500)),

                      //for adding some space
                      const SizedBox(height: 2),

                      //last seen time of user
                      Text(
                          list.isNotEmpty
                              ? list[0].isOnline
                              ? 'Online'
                              : MyDateUtil.getLastActiveTime(
                              context: context,
                              lastActive: list[0].lastActive)
                              : MyDateUtil.getLastActiveTime(
                              context: context,
                              lastActive: user.lastActive),
                          style: const TextStyle(
                              fontSize: 13, color: Colors.black54)),
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
