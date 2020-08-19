import 'dart:convert';
import 'package:test/test.dart';
import 'package:SmmHub/models/accounts_list.dart';
import 'dart:async';

void main() {
  test('AccountsList Class testing from JSON', () async {
    final stringJson =
        '{"response":[{"account_id":1600058392,"account_type":"general","account_status":1,"account_name":"Личный кабинет","access_role":"admin"},{"account_id":1604230960,"account_type":"general","account_status":1,"account_name":"Наталья Колотилина","access_role":"manager"},{"account_id":1604576992,"account_type":"general","account_status":1,"account_name":"Евгений Терехов","access_role":"manager"},{"account_id":1604847002,"account_type":"general","account_status":1,"account_name":"Алексей Ветров","access_role":"reports"},{"account_id":1605240452,"account_type":"general","account_status":1,"account_name":"Алексей Куколь","access_role":"manager"}]}';
    final map = json.decode(stringJson);
    final accs = AccountsList.fromJson(map);
    expect(accs.accounts.length, 5);
    expect(accs.accounts[0].accountName, 'Личный кабинет');
  });
}
