import 'package:json_annotation/json_annotation.dart';
import 'package:voco_case/app/data_provider/data_core/interfaces/base_network_model.dart';

part 'signIn.g.dart';

@JsonSerializable()
class SignIn extends BaseNetworkModel<SignIn> {
  String? token;

  SignIn({this.token});

  factory SignIn.fromJson(Map<String, dynamic> json) => _$SignInFromJson(json);
  Map<String, dynamic> toJson() => _$SignInToJson(this);

  @override
  SignIn fromJson(Map<String, dynamic> json) {
    return SignIn.fromJson(json);
  }
}
