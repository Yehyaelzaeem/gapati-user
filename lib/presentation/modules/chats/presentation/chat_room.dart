import 'package:cogina/presentation/modules/chats/presentation/widgets/chat_app_bar.dart';
import 'package:cogina/presentation/modules/chats/presentation/widgets/input_chat.dart';
import 'package:cogina/presentation/modules/chats/presentation/widgets/message_card.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/global/styles/colors.dart';
import '../../../../data/model/response/chat_user.dart';
import '../../../../data/model/response/message_model.dart';
import '../cubit/chat_cubit.dart';

class ChatRoomScreen extends StatelessWidget {
  final ChatUser user;
const ChatRoomScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    ChatCubit cubit =ChatCubit.get();
    cubit.getChatRoomName(user.name??'');
    var mq =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backGroundGray,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: ChatAppBarWidget(user: user,),
      ),
        body:  PopScope(
          canPop: true,
          onPopInvoked: (_) async {
            cubit.getChatRoomName('');
          },
          child: BlocConsumer<ChatCubit, ChatState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return SafeArea(
                            child: Column(
                              children: [
                                Expanded(
                                  child: StreamBuilder(
                                    stream: cubit.getAllMessages(user),
                                    builder: (context, snapshot) {
                                      switch (snapshot.connectionState) {
                                      //if data is loading
                                        case ConnectionState.waiting:
                                        case ConnectionState.none:
                                          return const SizedBox();

                                      //if some or all data is loaded then show it
                                        case ConnectionState.active:
                                        case ConnectionState.done:
                                          final data = snapshot.data?.docs;
                                          cubit.messagesList = data?.map((e) => Message.fromJson(e.data())).toList() ?? [];

                                          if (cubit.messagesList.isNotEmpty) {
                                            return ListView.builder(
                                                reverse: true,
                                                itemCount: cubit.messagesList.length,
                                                padding: EdgeInsets.only(top: mq.height * .01,left: 10),
                                                physics: const BouncingScrollPhysics(),
                                                itemBuilder: (context, index) {
                                                  return MessageCard(message: cubit.messagesList[index]);
                                                });
                                          } else {
                                            return const Center(
                                              child: Text('Say Hii! 👋',
                                                  style: TextStyle(fontSize: 20)),
                                            );
                                          }
                                      }
                                    },
                                  ),
                                ),

                                //progress indicator for showing uploading
                                if (cubit.isUploading)
                                  const Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                          padding:
                                          EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                          child: CircularProgressIndicator(strokeWidth: 2))),

                                //chat input filed
                                ChatInputWidget(user: user,),

                                //show emojis on keyboard emoji button click & vice versa
                                if (cubit.showEmoji)
                                  SizedBox(
                                    height: mq.height * .35,
                                    child: EmojiPicker(
                                      textEditingController: cubit.textController,
                                      config: const Config(),
                                    ),
                                  )
                              ],
                            ),
                          );
                    },
                  ),
        ),
    );
  }
}
