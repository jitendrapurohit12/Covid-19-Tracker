import 'package:covid_19/injection.iconfig.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final GetIt getIt = GetIt.asNewInstance();

@injectableInit
void configureInjection(String env) {
  $initGetIt(getIt, environment: env);
}
