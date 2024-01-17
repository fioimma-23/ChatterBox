import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../core/utils/image_constant.dart';
import '../../widgets/custom_image_view.dart';
import 'package:image_picker/image_picker.dart';
import 'own_message.dart'; // Import your OwnMsgWidget
import 'others_meassage.dart'; // Import your OtherMsgWidget
import 'message_model.dart';

class GroupWindowScreen extends StatefulWidget {
  final String name;
  final String userId;

  const GroupWindowScreen({Key? key, required this.name, required this.userId})
      : super(key: key);

  @override
  State<GroupWindowScreen> createState() => _GroupWindowScreenState();
}

class _GroupWindowScreenState extends State<GroupWindowScreen> {
  late final IO.Socket? socket;
  List<MsgModel> listMsg = [];
  final TextEditingController _msgController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ImagePicker _imagePicker = ImagePicker();
  late String _selectedImagePath = ImageConstant.imgCamera;
  bool showEmojiPicker = false;

  @override
  void initState() {
    super.initState();
    connect();
  }

  void connect() {
    socket = IO.io('ws://localhost:6969/ws', <String, dynamic>{
      "transports": ["websocket"],
      "autoconnect": false,
    });
    socket!.connect();
    socket!.onConnect((_) {
      print('connect');
      socket!.on('sendMsgServer', (msg) {
        if (msg['userId'] != widget.userId) {
          setState(() {
            listMsg.add(MsgModel(
                msg: msg['msg'], type: msg['type'], sender: msg['senderName']));
          });
        }
      });
    });
  }

  void sendMsg(String msg, String senderName) {
    MsgModel ownMsg = MsgModel(msg: msg, type: "ownMsg", sender: senderName);
    listMsg.add(ownMsg);
    setState(() {
      listMsg;
    });
    socket!.emit('sendMsg', {
      "type": "ownMsg",
      "msg": msg,
      "senderName": senderName,
      "userId": widget.userId
    });
  }
  Future<bool> sendImageToOtherUser(String imagePath) async {

    try {

      await Future.delayed(Duration(seconds: 2));


      bool success = true;

      return success;
    } catch (e) {
      print('Error sending image to other user: $e');
      return false;
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ChatRoom'),
        ),
        backgroundColor: Colors.white, // Replace with your desired background color
        body: Form(
          key: _formKey,
          child: SizedBox.expand(
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Your background or other UI components

                // Chat messages
                Positioned.fill(
                  bottom: 120, // Adjust as needed
                  child: ListView.builder(
                    itemCount: listMsg.length,
                    itemBuilder: (context, index) {
                      if (listMsg[index].type == 'ownMsg') {
                        return OwnMsgWidget(
                          msg: listMsg[index].msg,
                          sender: listMsg[index].sender,
                        );
                      } else {
                        return OtherMsgWidget(
                          msg: listMsg[index].msg,
                          sender: listMsg[index].sender,
                        );
                      }
                    },
                  ),
                ),

                // Input field and send button
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _msgController,
                            decoration: InputDecoration(
                              hintText: 'Type here...',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(width: 2),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              showEmojiPicker = !showEmojiPicker;
                            });
                          },
                          icon: const Icon(
                            Icons.emoji_emotions,
                            color: Colors.deepPurpleAccent,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            String msg = _msgController.text;
                            if (msg.isNotEmpty) {
                              sendMsg(_msgController.text, widget.name);
                              _msgController.clear();
                            }
                          },
                          icon: const Icon(
                            Icons.send,
                            color: Colors.deepPurpleAccent,
                          ),
                        ),
                        if (showEmojiPicker)
                          EmojiPicker(
                            onEmojiSelected: (category, emoji) {
                              _msgController.text =
                                  _msgController.text + emoji.emoji;
                            },
                          ),
                        CustomImageView(
                          imagePath: ImageConstant.imgCamera,
                          height: 30,
                          width: 28,
                          radius: BorderRadius.circular(28),
                          margin: EdgeInsets.only(bottom: 9),
                          onTap: () async {
                            PickedFile? pickedFile = (await _imagePicker.pickImage(source: ImageSource.camera)) as PickedFile?;

                            if (pickedFile != null) {
                              bool success = await sendImageToOtherUser(pickedFile.path);

                              if (success) {
                                setState(() {
                                  _selectedImagePath = pickedFile.path;
                                });
                              } else {
                                print('Failed to send image to other user.');
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
