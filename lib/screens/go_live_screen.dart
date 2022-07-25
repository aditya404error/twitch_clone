import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:twitch_clone/resources/firestore_method.dart';
import 'package:twitch_clone/screens/broadcast_screen.dart';
import 'package:twitch_clone/utils/colors.dart';
import 'package:twitch_clone/utils/utils.dart';
import 'package:twitch_clone/widgets/custom_button.dart';
import 'package:twitch_clone/widgets/custom_text_field.dart';

class GoLiveScreen extends StatefulWidget {
  const GoLiveScreen({Key? key}) : super(key: key);

  @override
  State<GoLiveScreen> createState() => _GoLiveScreenState();
}

class _GoLiveScreenState extends State<GoLiveScreen> {
  final TextEditingController _titleController = TextEditingController();
  Uint8List? image;
  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  goLive() async {
    String channelId = await FirestoreMethod().startLivestream(
      context,
      _titleController.text.trim(),
      image,
    );

    if (channelId.isNotEmpty) {
      showSnackBar(context, 'Livestream started succesfully');
      
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => BrodcastScreen(
            isBroadcaster: true,
            channelId: channelId,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      Uint8List? pickedImage = await imagePick();
                      if (pickedImage != null) {
                        setState(() {
                          image = pickedImage;
                        });
                      }
                    },
                    child: image != null
                        ? SizedBox(
                            height: 300,
                            child: Image.memory(image!),
                          )
                        : DottedBorder(
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(12),
                            dashPattern: const [10, 4],
                            strokeCap: StrokeCap.round,
                            color: buttonColor,
                            child: Container(
                              width: double.infinity,
                              height: 200,
                              decoration: BoxDecoration(
                                  color: buttonColor.withOpacity(0.07),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.folder,
                                    size: 40,
                                    color: buttonColor,
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    'Select thumbnail',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: primaryColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextfield(
                    text: 'Title',
                    hideText: false,
                    hintLable: 'Title',
                    textController: _titleController,
                  )
                ],
              ),
              CustomButton(
                text: 'Go live',
                onTap: goLive,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
