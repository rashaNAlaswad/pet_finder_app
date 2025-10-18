import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'app_test.dart' as app_test;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Pet Finder App Integration Tests', () {
    app_test.main();
  });
}
