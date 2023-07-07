import 'package:code_editor/code_editor.dart';
import 'package:flutter/material.dart';
import 'package:genkid/screens/settings_screens/html_editor/html_test.dart';

class HtmlWriteCode extends StatelessWidget {
  const HtmlWriteCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // example of a easier way to write code instead of writing it in a single string
    List<String> contentOfPage1 = [

    ];

    // The files displayed in the navigation bar of the editor.
    // You are not limited.
    // By default, [name] = "file.${language ?? 'txt'}", [language] = "text" and [code] = "",
    List<FileEditor> files = [
      FileEditor(
        name: "html,code",
        language: "html",
        code: contentOfPage1.join("\n"), // [code] needs a string
      ),
    ];

    // The model used by the CodeEditor widget, you need it in order to control it.
    // But, since 1.0.0, the model is not required inside the CodeEditor Widget.
    EditorModel model = EditorModel(
      files: files, // the files created above
      // you can customize the editor as you want
      styleOptions: EditorModelStyleOptions(
        fontSize: 13,
     placeCursorAtTheEndOnEdit: true,
      ),
    );

    // A custom TextEditingController.
    final myController = TextEditingController(text: 'hello!');

    return Scaffold(
      appBar: AppBar(title: const Text("code_editor example")),
      body: SingleChildScrollView(
        // /!\ important because of the telephone keypad which causes a "RenderFlex overflowed by x pixels on the bottom" error
        // display the CodeEditor widget
        child: CodeEditor(
          model: model, // the model created above, not required since 1.0.0
          edit: true, // can edit the files? by default true
          onSubmit: (String? language, String? value) {
            print(contentOfPage1);
            print(value?.split("\n"));
            Future.delayed(Duration(seconds: 4),() {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HtmlTestCode(contentOfPage1: value!.split("\n")),));
            },);
          },
          disableNavigationbar:
          false, // hide the navigation bar ? by default false
          textEditingController:
          myController, // Provide an optional, custom TextEditingController.
        ),
      ),
    );
  }
}
