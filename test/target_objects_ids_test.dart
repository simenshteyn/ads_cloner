import 'package:test/test.dart';
import 'package:SmmHub/api/target_objects_ids.dart';

void main() {
  test('Countries map test', () async {
    var result = getCountyById(1);
    expect(result, 'Россия, ');
  });
}
