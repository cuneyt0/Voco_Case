import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_case/app/constant/string_constant.dart';
import 'package:voco_case/app/screen/sign_in/controller/signIn_controller.dart';
import 'package:voco_case/app/ui_component/textfield/vaco_textfield.dart';
import 'package:voco_case/app/utilities/extensions/size_extensions.dart';

final signInController = ChangeNotifierProvider((ref) => SignInController());

class SignInView extends ConsumerWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final read = ref.read(signInController);
    final watch = ref.watch(signInController);
    return Scaffold(
        appBar: AppBar(),
        body: Form(
          key: watch.formKey,
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 30),
            padding: EdgeInsets.only(
                top: context.screenHeight(.1), left: 10, right: 10, bottom: 20),
            itemBuilder: (context, index) =>
                _bodyList(context, read, watch)[index],
            itemCount: _bodyList(context, read, watch).length,
          ),
        ));
  }

  List<Widget> _bodyList(BuildContext context, SignInController read,
          SignInController watch) =>
      [
        _email(watch),
        _password(watch),
        ElevatedButton(
            onPressed: () {
              read.postSignIn();
            },
            child: const Text(signInButtonName))
      ];

  VacoTextField _email(SignInController watch) {
    return VacoTextField(
      controller: watch.emailController,
      hintText: email,
      keyboardType: TextInputType.emailAddress,
      validator: (value) => watch.validateEmail(value: value),
      prefixIcon: const Icon(Icons.email),
    );
  }

  VacoTextField _password(SignInController watch) {
    return VacoTextField(
      controller: watch.passwordController,
      hintText: password,
      obscureText: !watch.isShowPassword,
      keyboardType: TextInputType.visiblePassword,
      prefixIcon: const Icon(Icons.lock),
      suffixIcon: InkWell(
          onTap: watch.showPassword,
          child: Icon(
            watch.isShowPassword ? Icons.visibility : Icons.visibility_off,
          )),
    );
  }
}
