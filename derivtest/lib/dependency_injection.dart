import 'package:derivtest/service_registration/register_blocs.dart';
import 'package:derivtest/service_registration/register_repo.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
Future<void> setupServicesLocator() async {
  RegisterBlocs();
  RegisterRepository();
}
