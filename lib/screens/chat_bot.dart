import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';

import '../widgets/message.dart';



class ChatBoot extends StatefulWidget {
  const ChatBoot({Key? key}) : super(key: key);

  @override
  State<ChatBoot> createState() => _ChatBootState();
}

class _ChatBootState extends State<ChatBoot> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> messages = [];
  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: [
                Expanded(
                  child:
                  Container(
                      margin: EdgeInsets.all(10),
                      child: const Center(
                        child: Text
                          ("GenkidBot",style: TextStyle( fontSize: 20 ,fontWeight: FontWeight.w600,color: Colors.blueAccent,),
                        ),
                      )
                  ),

                ),

              ],
            ),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: MessagesScreen(messages: messages)),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 8,
              ),
              color: Colors.white,
              child: Row(
                children: [

                  Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Enter a massage",
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        controller: _controller,
                      )
                  ),
                  IconButton(
                    icon: const Icon(Icons.send,
                        size: 30, color: Colors.blueAccent),
                    onPressed: () {
                      sendMessage(_controller.text);
                      _controller.clear();
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print('Message is empty');
    } else {
      setState(() {
        addMessage(
            Message(
              text: DialogText(text: [text]),
            ),
            true);
      });
      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      if (response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
    print('$messages' );
  }

}
