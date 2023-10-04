import 'package:json_annotation/json_annotation.dart';
import 'package:voco_case/app/data_provider/data_core/interfaces/base_network_model.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData extends BaseNetworkModel<UserData> {
  int? id;
  String? email;
  String? first_name;
  String? last_name;
  String? avatar;

  UserData({this.avatar, this.email, this.first_name, this.id, this.last_name});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);

  @override
  UserData fromJson(Map<String, dynamic> json) {
    return UserData.fromJson(json);
  }
}
