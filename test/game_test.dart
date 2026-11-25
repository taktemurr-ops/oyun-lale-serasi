import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_lale_serasi/oyun_lale_serasi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(laleSerasiConfig.title.length, 33);
    expect(laleSerasiConfig.tagline.length, 33);
    for (final s in laleSerasiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(laleSerasiConfig.gameId, laleSerasiId);
    expect(laleSerasiRules.gameId, laleSerasiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(laleSerasiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: laleSerasiId, optionalMechanics: laleSerasiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(laleSerasiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
