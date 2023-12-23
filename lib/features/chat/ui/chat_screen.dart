import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/features/chat/data/model/chats_response.dart';
import '../../../theme/app_assets.dart';
import '../../../theme/app_colors.dart';
import '../data/providers/chat_provider.dart';

class ChatScreen extends StatefulHookConsumerWidget {
  final Conversation conversation;
  const ChatScreen({super.key,required this.conversation});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  TextEditingController textController =TextEditingController();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {
      ref.read(chatNotifierProvider.notifier).getMessagesHistory(widget.conversation.conversationId??'');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatNotifierProvider);
    return SafeArea(
      child: Scaffold(
        body:
        Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10,),
              width: double.infinity,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child:Icon(Icons.arrow_back_ios_rounded,size: 30,),

                  ),
                  const Spacer(),
                  Column(
                    children: [
                      ClipOval(
                        child: CachedNetworkImage(
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                          imageUrl: widget.conversation.contact?.imageUrl ?? '',
                          placeholder: (context, url) => Image.asset(
                              AppAssets.whiteLogo,
                              fit: BoxFit.cover),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Text(
                        widget.conversation.contact?.name??'',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () {
                      //TODO Settings
                    },
                  ),
                ],
              ),
            ),
            Spacer(),
            Divider(),
            buildMessageInput(),
          ],
        ),
      ),
    );
  }





  // buildMessageList() {
  //   return StreamBuilder(stream: ref.watch(chatNotifierProvider.notifier).getMessages(
  //     ref.read(authNotifierProvider).user!.id??0,
  //     widget.proposal.provider?.id??0,
  //     widget.proposal.id??0,
  //   ), builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
  //     if(snapshot.hasError)
  //     {
  //       return const Center(
  //         child: Text('حدث خطأ ما'),
  //       );
  //     }
  //     else if(snapshot.connectionState==ConnectionState.waiting)
  //     {
  //       return const Center(
  //         child: CircularProgressIndicator(),
  //       );
  //     }
  //     else if(snapshot.data!.docs.isEmpty)
  //     {
  //       return const Center(
  //         child: Text('No Messages'),
  //       );
  //     }
  //     else
  //     {
  //       return ListView.builder(
  //         reverse: true,
  //         itemCount: snapshot.data!.docs.length,
  //         itemBuilder: (context, index) {
  //           return buildMessageItem(snapshot.data!.docs[index]);
  //         },
  //       );
  //     }
  //
  //   });
  // }
  //
  // Widget buildMessageItem(DocumentSnapshot document) {
  //   Map<String, dynamic> data = document.data() as Map<String, dynamic>;
  //
  //   var alignment =
  //   data['sender'] == "user" ? Alignment.centerRight : Alignment.centerLeft;
  //   return
  //     data['type']=="text"?
  //     Container(
  //       alignment: alignment,
  //       child: Column(
  //         crossAxisAlignment: data['sender']=="user"?CrossAxisAlignment.start:CrossAxisAlignment.end,
  //         children: [
  //           Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 15),
  //             child: Text(data['sender']=="user"?'أنت':widget.proposal.provider?.name??""),
  //           ),
  //           Container(
  //             padding: const EdgeInsets.all(10),
  //             margin: const EdgeInsets.all(10),
  //             constraints: BoxConstraints(
  //               maxWidth: MediaQuery.of(context).size.width * 0.7,
  //             ),
  //             decoration: BoxDecoration(
  //               color: data['sender'] == "user"
  //                   ? AppColors.primaryColor
  //                   : Colors.grey[300],
  //               borderRadius: BorderRadius.circular(10),
  //             ),
  //             child: Text(
  //               data['message'],
  //               style: TextStyle(
  //                 color: data['sender'] == "user"
  //                     ? Colors.white
  //                     : Colors.black,
  //               ),
  //             ),
  //           )
  //         ],
  //       ), // Column
  //     ) :
  //     data['type']=="location"?
  //     Container(
  //       alignment: alignment,
  //       child: Column(
  //         crossAxisAlignment: data['sender']=="user"?CrossAxisAlignment.start:CrossAxisAlignment.end,
  //         children: [
  //           Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 15),
  //             child: Text(data['sender']=="user"?'أنت':widget.proposal.provider?.name??""),
  //           ),
  //           Container(
  //             padding: const EdgeInsets.all(10),
  //             margin: const EdgeInsets.all(10),
  //             width: MediaQuery.of(context).size.width * 0.7,
  //             height: MediaQuery.of(context).size.width * 0.7,
  //             decoration: BoxDecoration(
  //               color: data['sender'] == "user"
  //                   ? AppColors.primaryColor
  //                   : Colors.grey[300],
  //               borderRadius: BorderRadius.circular(10),
  //             ),
  //             child:
  //             GoogleMap(
  //               scrollGesturesEnabled: false,
  //               onTap: (latLng) {
  //                 launch('https://maps.google.com/?q=${data['message']}');
  //               },
  //               markers: {
  //                 Marker(
  //                   markerId: MarkerId("1"),
  //                   position: LatLng(double.parse(data['message'].split(",")[0]),
  //                       double.parse(data['message'].split(",")[1])),
  //                 )
  //               },
  //               mapType: MapType.normal,
  //               initialCameraPosition: CameraPosition(
  //                 target: LatLng(double.parse(data['message'].split(",")[0]),
  //                     double.parse(data['message'].split(",")[1])),
  //                 zoom: 15,
  //               ),
  //             ),
  //           ),
  //         ],
  //       ), // Column
  //     )
  //         : Container(
  //       alignment: alignment,
  //       child: Column(
  //         crossAxisAlignment: data['sender']=="user"?CrossAxisAlignment.start:CrossAxisAlignment.end,
  //         children: [
  //           Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 15),
  //             child: Text(data['sender']=="user"?'أنت':widget.proposal.provider?.name??""),
  //           ),
  //           Container(
  //             padding: const EdgeInsets.all(10),
  //             margin: const EdgeInsets.all(10),
  //             width: MediaQuery.of(context).size.width * 0.7,
  //             height: MediaQuery.of(context).size.width * 0.7,
  //             decoration: BoxDecoration(
  //               color: data['sender'] == "user"
  //                   ? AppColors.primaryColor
  //                   : Colors.grey[300],
  //               borderRadius: BorderRadius.circular(10),
  //             ),
  //             child:CachedNetworkImage(
  //               imageUrl:data['message']??"" ,
  //               imageBuilder: (context, imageProvider) => Container(
  //                 decoration: BoxDecoration(
  //                   shape: BoxShape.rectangle,
  //                   image: DecorationImage(
  //                     image: imageProvider,
  //                   ),
  //                 ),
  //               ),
  //               placeholder: (context, url) =>
  //                   Image.asset(AppAssets.recLogo, fit: BoxFit.fitWidth),
  //               errorWidget: (context, url, error) =>
  //                   Image.asset(AppAssets.recLogo, fit: BoxFit.fitWidth),
  //             ),
  //           ),
  //         ],
  //       ), // Column
  //     );
  // }


  buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: Colors.grey, // Replace with your color
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Row(
          children: [
            Expanded(
              child: IntrinsicHeight(
                child: SizedBox.expand(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {});
                      },
                      controller: textController,
                      minLines: 1, // Minimum number of lines
                      maxLines: 5, // Allow unlimited number of lines
                      decoration: const InputDecoration(
                        hintText: 'Start a message...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: textController.text.isEmpty
                  ? null
                  : () {
                if (textController.text.isNotEmpty) {
                  textController.clear();
                }
              },
              icon: CircleAvatar(
                backgroundColor: AppColors.primaryColor.withOpacity(
                    textController.text.isEmpty ? 0.7 : 1),
                child: Icon(
                  Icons.send,
                  color: AppColors.whiteColor.withOpacity(
                      textController.text.isEmpty ? 0.5 : 1),                ),
              ),
            ),
          ],
        ),
      ),
    )
    ;
  }

}
