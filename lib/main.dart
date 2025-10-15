import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app.dart';
import 'core/di/dependency_injection.dart';
import 'core/helper/bloc_observer_checker.dart';
import 'core/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ScreenUtil.ensureScreenSize();

  setupGetIt();

  if (kDebugMode) {
    Bloc.observer = const BlocObserverChecker();
  }

  runApp(MainApp(appRouter: AppRouter()));
}
