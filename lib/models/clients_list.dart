import 'package:ads_cloner/api/vk_api_objects.dart';
import 'package:json_annotation/json_annotation.dart';

part 'clients_list.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class ClientsList {
  @JsonKey(name: 'response')
  List<Client> clients;
  @JsonKey(name: 'error')
  ErrorObject errorResponse;
  ClientsList(this.clients, this.errorResponse);
  factory ClientsList.fromJson(Map<String, dynamic> json) => _$ClientsListFromJson(json);
  Map<String, dynamic> toJson() => _$ClientsListToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Client {
  int id;
  String name, dayLimit, allLimit;
  Client(this.name, this.dayLimit, this.allLimit);
  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
  Map<String, dynamic> toJson() => _$ClientToJson(this);
}

