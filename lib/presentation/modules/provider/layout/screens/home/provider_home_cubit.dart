import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'provider_home_state.dart';

class ProviderHomeCubit extends Cubit<ProviderHomeState> {
  ProviderHomeCubit() : super(ProviderHomeInitial());
}
