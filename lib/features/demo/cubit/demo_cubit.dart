import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'demo_state.dart';

@Injectable()
class DemoCubit extends Cubit<DemoState> {
  DemoCubit() : super(DemoState());
}
