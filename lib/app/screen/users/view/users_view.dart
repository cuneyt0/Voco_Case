import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_case/app/data_provider/model/users/user/user.dart';
import 'package:voco_case/app/screen/users/controller/user_controller.dart';
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
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      ref.read(userController).fetchUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    final read = ref.read(userController);
    final watch = ref.watch(userController);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text("Users"),
        ),
        body: ResultStateBuilder(
            resultState: watch.resultState,
            completed: (User data) {
              return ListView.builder(
                  itemCount: data.data?.length,
                  itemBuilder: (context, index) =>
                      Text('${data.data?[index].email}'));
            }));
  }
}
