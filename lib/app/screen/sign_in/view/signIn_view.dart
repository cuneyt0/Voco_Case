import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_case/app/screen/sign_in/viewmodel/signIn_viewmodel.dart';
import 'package:voco_case/app/ui_component/textfield/vaco_textfield.dart';

final signInViewModel = ChangeNotifierProvider((ref) => SignInViewModel());

class SignInView extends ConsumerWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final read = ref.read(signInViewModel);
    final watch = ref.watch(signInViewModel);
    return Scaffold(
        appBar: AppBar(),
        body: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 30),
          padding:
              const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 20),
          itemBuilder: (context, index) =>
              _bodyList(context, read, watch)[index],
          itemCount: _bodyList(context, read, watch).length,
        ));
  }

  List<Widget> _bodyList(
          BuildContext context, SignInViewModel read, SignInViewModel watch) =>
      [
        VacoTextField(
          controller: watch.controller,
          hintText: "Kullanıcı Adı",
        ),
        VacoTextField(
          controller: watch.controller,
          hintText: "Kullanıcı Adı",
        )
      ];
}
