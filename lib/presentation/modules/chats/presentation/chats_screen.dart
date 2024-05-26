import 'package:cogina/core/assets_constant/images.dart';
import 'package:cogina/presentation/modules/chats/presentation/widgets/chat_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/global/styles/colors.dart';
import '../../../../data/model/response/chat_user.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../component/custom_app_bar.dart';
import '../../../component/custom_loading_widget.dart';
import '../cubit/chat_cubit.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  ChatCubit cubit =ChatCubit.get();
  List<ChatUser> _list = [];

  @override
  void initState() {
    cubit.getSelfInfo();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: AppColors.backGroundGray,
      appBar:  CustomAppBar(
        color: AppColors.backGroundGray,
        title: LocaleKeys.messages.tr(),
      ),
      body:  StreamBuilder(
        stream: cubit.getMyUsersId(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
          //if data is loading
            case ConnectionState.waiting:
            case ConnectionState.none:
              return const CustomLoadingWidget();
          //if some or all data is loaded then show it
            case ConnectionState.active:
            case ConnectionState.done:
              return StreamBuilder(
                stream: cubit.getAllUsers(snapshot.data?.docs.map((e) => e.id).toList() ?? []),
                //get only those user, who's ids are provided
                builder: (context, snapshot) {
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
                      _list = data?.map((e) => ChatUser.fromJson(e.data())).toList() ?? [];
                      if (_list.isNotEmpty) {
                        return ListView.builder(
                            itemCount:  _list.length,
                            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .01),
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ChatItemWidget(chatUser: _list[index],);
                            });
                      } else {
                        return Column(
                          children: [
                            Image.asset(RestaurantImages.chat),
                            const Center(
                              child: Text('Not Found Any Conversation!',
                                  style: TextStyle(fontSize: 20)),
                            ),
                          ],
                        );
                      }
                  }
                },
              );
          }
        },
      ),
    );
  }
}
