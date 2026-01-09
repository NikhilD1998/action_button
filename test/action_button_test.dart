import 'package:flutter_test/flutter_test.dart';
import 'package:action_button/action_button.dart';

void main() {
  test('ActionState enum has expected values', () {
    expect(ActionState.values.length, 4);
    expect(ActionState.idle.toString(), 'ActionState.idle');
    expect(ActionState.loading.toString(), 'ActionState.loading');
    expect(ActionState.success.toString(), 'ActionState.success');
    expect(ActionState.error.toString(), 'ActionState.error');
  });
}
