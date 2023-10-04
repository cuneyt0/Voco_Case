import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_case/app/constant/string_constant.dart';
import 'package:voco_case/app/data_provider/data_core/freezed/sw_error.dart';
import 'package:voco_case/app/data_provider/model/users/user/user.dart';
import 'package:voco_case/app/screen/users/controller/user_controller.dart';
import 'package:voco_case/app/ui_component/image/vaco_image.dart';
import 'package:voco_case/core/result_state_builder/result_state_builder.dart';

final userController = ChangeNotifierProvider((ref) => UserController());

class UsersView extends ConsumerStatefulWidget {
  const UsersView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UsersViewState();
}

class _UsersViewState extends ConsumerState<UsersView> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ref.read(userController).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final read = ref.read(userController);
    final watch = ref.watch(userController);
    return Scaffold(appBar: _appbar(read), body: _body(watch));
  }

  AppBar _appbar(UserController read) {
    return AppBar(
      automaticallyImplyLeading: true,
      title: const Text(userListTitle),
      actions: [
        IconButton(
            onPressed: () async => await read.logOut(context),
            icon: const Icon(Icons.logout))
      ],
    );
  }

  ResultStateBuilder<User, SwError> _body(UserController watch) {
    return ResultStateBuilder(
      resultState: watch.resultState,
      completed: (User data) {
        return ListView.builder(
          itemCount: data.data?.length,
          itemBuilder: (context, index) => _itemBuilder(data, index),
        );
      },
    );
  }

  Card _itemBuilder(User data, int index) {
    return Card(
      child: ListTile(
        leading: _avatar(data, index),
        title: _userInfo(data, index),
        subtitle: _email(data, index),
      ),
    );
  }

  VocoImage _avatar(User data, int index) {
    return VocoImage(imageUrl: '${data.data?[index].avatar}');
  }

  Text _email(User data, int index) => Text('${data.data?[index].email}');

  Text _userInfo(User data, int index) {
    return Text(
        '${data.data?[index].first_name} ${data.data?[index].last_name}');
  }
}
