import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart';
import '../../../../core/notification/device_token.dart';
import '../../../../core/notification/notification_access_token.dart';
import '../../../../core/routing/navigation_services.dart';
import '../../../../data/model/response/chat_user.dart';
import '../../../../data/model/response/message_model.dart';
import '../../../../domain/logger.dart';
import '../../../../main.dart';
import '../../layout/screens/more/profile/profile_cubit.dart';
part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> with WidgetsBindingObserver {
  ChatCubit() : super(ChatInitial()){
    WidgetsBinding.instance.addObserver(this);
    putToken();
  }
  String? fcmToken;
  void putToken()async{
    fcmToken =await getDeviceToken();
  }
  static ChatCubit get ()=>BlocProvider.of(NavigationService.navigationKey.currentContext!);
  ChatUser? me ;
  List<Message> messagesList = [];
  bool showEmoji = false, isUploading = false;
  TextEditingController textController = TextEditingController();

  // for accessing cloud fireStore database
  FirebaseFirestore fireStore = FirebaseFirestore.instance;


  // for accessing firebase storage
  FirebaseStorage storage = FirebaseStorage.instance;

  ProfileCubit cubit=ProfileCubit.get(appContext);
  // for getting current user info
   Future<void> getSelfInfo() async {
    await fireStore.collection('users').doc(cubit.profileModel!.id.toString()).get().then((user) async {
      if (user.exists) {
        me = ChatUser.fromJson(user.data()!);
        // await getFirebaseMessagingToken();
        updateActiveStatus(true);
        log('My Data:',' ${user.data()}');
      } else {
        await createUser().then((value) => getSelfInfo());
      }
    });
  }

  // for creating a new user
   Future<void> createUser() async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();
    final chatUser = ChatUser(
        id: cubit.profileModel!.id.toString()??'',
        name: '${cubit.profileModel!.firstName??''} ${cubit.profileModel!.lastName??''}',
        phone:cubit.profileModel!.mobileNumber??'',
        about: "Hey, I'm using Cogina Chat!",
        image: cubit.profileModel!.image??'',
        createdAt: time,
        isOnline: false,
        lastActive: time,
        pushToken:fcmToken??'');

    return await fireStore
        .collection('users')
        .doc(cubit.profileModel!.id.toString())
        .set(chatUser.toJson());
  }

  @override
  Future<void> close() {
    WidgetsBinding.instance.removeObserver(this);
    return super.close();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive || state == AppLifecycleState.detached) {
      updateActiveStatus(false);
    } else if (state == AppLifecycleState.resumed) {
      updateActiveStatus(true);
    }
  }

  // update online or last active status of user
   Future<void> updateActiveStatus(bool isOnline) async {
    fireStore.collection('users').doc(cubit.profileModel!.id!.toString()).update({
      'is_online': isOnline,
      'last_active': DateTime.now().millisecondsSinceEpoch.toString(),
      'push_token': fcmToken,
    });
  }

  ///Update Users Profile
  Future<void> updateUserProfile({String? name, String? phone, String? image}) async {
    final ref =fireStore.collection('users').doc(cubit.profileModel!.id!.toString());
    if(name!=null){
      ref.update({
        'name': name,
      });
    }
    if(phone!=null){
      ref.update({
        'phone': phone,
      });
    }
    if(image!=null){
      ref.update({
        'image': image,
      });
    }
  }

  ///************** Chat Screen Related APIs **************


  // useful for getting conversation id
   String getConversationID(String id) => cubit.profileModel!.id!.toString().hashCode <= id.hashCode
      ? '${cubit.profileModel!.id!.toString()}_$id'
      : '${id}_${cubit.profileModel!.id!.toString()}';

  Future<void> openNewChat(String userId) async {
    await fireStore
        .collection('users')
        .doc(cubit.profileModel!.id.toString())
        .collection('my_users')
        .doc(userId.toString())
        .set({});

  }
  // for getting id's of known users from fireStore database
  Stream<QuerySnapshot<Map<String, dynamic>>> getMyUsersId() {
    return fireStore
        .collection('users')
        .doc(cubit.profileModel!.id.toString())
        .collection('my_users')
        .snapshots();

  }


  // for getting all users from fireStore database
   Stream<QuerySnapshot<Map<String, dynamic>>> getAllUsers(List<String> userIds) {
    return fireStore
        .collection('users')
        .where('id',
        whereIn: userIds.isEmpty
            ? ['']
            : userIds) //because empty list throws an error
    // .where('id', isNotEqualTo: user.uid)
        .snapshots();
  }

  // for getting specific user info
   Stream<QuerySnapshot<Map<String, dynamic>>> getUserInfo(
      ChatUser chatUser) {
    return fireStore
        .collection('users')
        .where('id', isEqualTo: chatUser.id)
        .snapshots();
  }


  //get only last message of a specific chat
   Stream<QuerySnapshot<Map<String, dynamic>>> getLastMessage(
      ChatUser user) {
     return fireStore
         .collection('chats/${getConversationID(user.id)}/messages/')
         .orderBy('sent_time', descending: true)
         .limit(1)
         .snapshots();
  }

// دالة لحساب عدد الرسائل غير المقروءة
  Future<void> getUnreadMessagesCount(String userId) async {
    try {
      // الحصول على معرف المحادثة
      String conversationId = getConversationID(userId);

      // استعلام لجلب الرسائل التي تحتوي على الحقل 'read' فارغ
      QuerySnapshot querySnapshot = await fireStore
          .collection('chats/$conversationId/messages/')
          .where('read', isEqualTo: '')
          .get();

      // حساب عدد الرسائل غير المقروءة
      int unreadCount = querySnapshot.docs.length+1;

      // عرض عدد الرسائل أو التعامل معه كما تريد
      getCountMessage(unreadCount);
    } catch (e) {
      print('حدث خطأ: $e');
    }
  }


  ///Message
  // for getting all messages of a specific conversation from fireStore database
   Stream<QuerySnapshot<Map<String, dynamic>>> getAllMessages(ChatUser user) {
     return fireStore
         .collection('chats/${getConversationID(user.id)}/messages/')
         .orderBy('sent_time', descending: true)
         .snapshots();

  }
  // for adding an user to my user when first message is send
   Future<void> sendFirstMessage(ChatUser chatUser, String msg, Type type) async {
     await fireStore
         .collection('users')
         .doc(chatUser.id)
         .collection('my_users')
         .doc(cubit.profileModel!.id.toString())
         .set({}).then((value) => sendMessage(chatUser, msg, type));

  }
  // for sending message
   Future<void> sendMessage(ChatUser chatUser, String msg, Type type) async {
    //message sending time (also used as id)
    final time = DateTime.now().millisecondsSinceEpoch.toString();
    //message to send
    final Message message = Message(
        toId: chatUser.id,
        msg: msg,
        read: '',
        type: type,
        fromId: cubit.profileModel!.id.toString()??'',
        sentTime: time);
    final ref = fireStore
        .collection('chats/${getConversationID(chatUser.id)}/messages/');
    await ref.doc(time).set(message.toJson()).then((value) =>
        sendPushNotification(chatUser, type == Type.text ? msg : 'image'));
  }

  //update read status of message
   Future<void> updateMessageReadStatus(Message message) async {
     fireStore
         .collection('chats/${getConversationID(message.fromId)}/messages/')
         .doc(message.sentTime)
         .update({'read': DateTime.now().millisecondsSinceEpoch.toString()});

  }

  //send chat image
   Future<void> sendChatImage(ChatUser chatUser, File file) async {

     final ext = file.path.split('.').last;

     //storage file ref with path
     final ref = storage.ref().child(
         'images/${getConversationID(chatUser.id)}/${DateTime.now().millisecondsSinceEpoch}.$ext');

     //uploading image
     await ref
         .putFile(file, SettableMetadata(contentType: 'image/$ext'))
         .then((p0) {});

     //updating image in fireStore database
     final imageUrl = await ref.getDownloadURL();
     await sendMessage(chatUser, imageUrl, Type.image);
  }

  //delete message
   Future<void> deleteMessage(Message message) async {
     await fireStore
         .collection('chats/${getConversationID(message.toId)}/messages/')
         .doc(message.sentTime)
         .delete();

     if (message.type == Type.image) {
       await storage.refFromURL(message.msg).delete();
     }

  }

  //update message
   Future<void> updateMessage(Message message, String updatedMsg) async {
     await fireStore
         .collection('chats/${getConversationID(message.toId)}/messages/')
         .doc(message.sentTime)
         .update({'msg': updatedMsg});
   }




  ///Notification
  // for sending push notification (Updated Codes)
   Future<void> sendPushNotification(ChatUser chatUser, String msg) async {
    try {
      final body = {
        "message": {
          "token": chatUser.pushToken,
          "notification": {
            "title": '${cubit.profileModel!.firstName??''} ${cubit.profileModel!.lastName??''}', //our name should be send
            "body": msg,
          },
        }
      };

      // Firebase Project > Project Settings > General Tab > Project ID
      const projectID = 'delivego-47c93';

      // get firebase admin token
      final bearerToken = await NotificationAccessToken.getToken;

      // handle null token
      if (bearerToken == null) return;

      await post(
        Uri.parse('https://fcm.googleapis.com/v1/projects/$projectID/messages:send'),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $bearerToken'
        },
        body: jsonEncode(body),
      );
    } catch (e) {
      log('hyena', e.toString());
    }
  }

  int countMessage =1;
   void getCountMessage(int x){
     countMessage=x;
     emit(IncreaseCountState());
   }
   void removeCount(){
     countMessage = 1;
     emit(IncreaseCountState());
   }
  String? chatRoom;
  void getChatRoomName(String name){
    chatRoom =name;
    emit(IncreaseCountState());
  }
}
