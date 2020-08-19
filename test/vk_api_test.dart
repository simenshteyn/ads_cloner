import 'package:test/test.dart';
import 'package:SmmHub/api/vk_api.dart';
import 'dart:async';


void main(){
  test('VK api should return list of accounts',
   () async {
     final vk = VkApi(userToken: 'a889969ff058900b4df0b25aed1eb56d27cf2d4776a27f238b0030603c145ddf4cd59968085ae83c105b4');
     final accounts = await vk.adsGetAccounts();
     expect(accounts.accounts.length, 5);
     expect(accounts.accounts[0].accountName, 'Личный кабинет');
   } );
}