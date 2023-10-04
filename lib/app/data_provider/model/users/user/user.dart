import 'package:json_annotation/json_annotation.dart';
import 'package:voco_case/app/data_provider/data_core/interfaces/base_network_model.dart';
import 'package:voco_case/app/data_provider/model/users/user_data/user_data.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends BaseNetworkModel<User> {
  int? page;
  int? per_page;
  int? total;
  List<UserData>? data;

  User({this.data, this.page, this.per_page, this.total});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  User fromJson(Map<String, dynamic> json) {
    return User.fromJson(json);
  }
}
