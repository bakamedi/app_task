import 'package:flutter_meedu/providers.dart';
import 'package:flutter_meedu/notifiers.dart';

import '../../../../domain/repositories/db_repository.dart';
import '../../../../inject_repository.dart';
import '../../../router/app_routes/task_route.dart';
import 'splash_state.dart';

final splashProvider = Provider.state<SplashController, SplashState>(
  (_) => SplashController(
    SplashState.initialState,
    dbRepository: Repositories.dbRep.read(),
  ),
);

class SplashController extends StateNotifier<SplashState> {
  SplashController(super.initialState, {required DbRepository dbRepository})
    : _dbRepository = dbRepository {
    init();
  }
  final DbRepository _dbRepository;

  void init() async {
    await _dbRepository.connect();
    Future.delayed(const Duration(seconds: 2), () {
      onlyUpdate(state = state.copyWith(routeName: TaskRoute.path));
    });
  }
}
