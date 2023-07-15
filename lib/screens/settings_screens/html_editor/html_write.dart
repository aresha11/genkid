import 'package:code_editor/code_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genkid/cubit/auth/get_user_information_cubit/get_user_information_cubit.dart';
import 'package:genkid/cubit/html_cubit/html_cubit.dart';
import 'package:genkid/cubit/posts_cubit/posts_cubit.dart';
import 'package:genkid/screens/settings_screens/html_editor/html_test.dart';
import 'package:genkid/widgets/main_button.dart';
import 'package:sizer/sizer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HtmlWriteCode extends StatefulWidget {
  const HtmlWriteCode({Key? key}) : super(key: key);

  @override
  State<HtmlWriteCode> createState() => _HtmlWriteCodeState();
}

class _HtmlWriteCodeState extends State<HtmlWriteCode> {

  @override
  void initState() {
    context.read<HtmlCubit>().empty=true;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // example of a easier way to write code instead of writing it in a single string
    List<String> contentOfPage1 = [];

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

    return BlocConsumer<HtmlCubit, HtmlState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff1D5C92),
            elevation: 0,
            centerTitle: true,
            title: Text("Html Editor", style: TextStyle(fontSize: 20.sp,
                fontWeight: FontWeight.w300,
                color: Colors.white),),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SingleChildScrollView(
                  // /!\ important because of the telephone keypad which causes a "RenderFlex overflowed by x pixels on the bottom" error
                  // display the CodeEditor widget
                  child: CodeEditor(
                    model: model,
                    // the model created above, not required since 1.0.0
                    edit: true,
                    // can edit the files? by default true
                    onSubmit: (String? language, String? value) async {
                      await context
                          .read<HtmlCubit>()
                          .getCode(code: value!.split("\n"));
                      //print(value!.split("\n"));
                      print(context.read<HtmlCubit>().htmlCode);
                      // print(value?.split("\n"));
                      // Future.delayed(Duration(seconds: 4),() {
                      //   Navigator.push(context, MaterialPageRoute(builder: (context) => HtmlTestCode(contentOfPage1: value!.split("\n")),));
                      // },);
                    },
                    disableNavigationbar: false,
                    // hide the navigation bar ? by default false
                    textEditingController:
                        myController, // Provide an optional, custom TextEditingController.
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  height: 40.h,
                  child: BlocConsumer<HtmlCubit, HtmlState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      return
                        context.read<HtmlCubit>().empty==true?
                            Container()
                      :
                        WebView(
                        initialUrl:
                            'data:text/html;charset=utf-8,${Uri.encodeComponent(context.read<HtmlCubit>().htmlCode.join("\n"))}',
                        javascriptMode: JavascriptMode.unrestricted,
                      );
                    },
                  ),
                ),
                context.read<HtmlCubit>().empty==true?
                Container()
                    :
               Container(
                 margin: EdgeInsets.symmetric(horizontal: 18.w),
                 child: MainButton(
                   color: Colors.white,
                   onPressed:(){
                     context.read<PostsCubit>().addPost( userName: context.read<GetUserInformationCubit>().userInformationModel.firstName.toString(),post:context.read<HtmlCubit>().htmlCode.join("\n") );
                   } ,
                   title:"Share Code" ,
                 ),
               )
              ],
            ),
          ),

        );
      },
    );
  }
}
