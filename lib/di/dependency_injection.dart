import 'package:coding_test/core/network/network_info.dart';
import 'package:coding_test/data/datasources/remote_datasource/remote_datasource.dart';
import 'package:coding_test/data/datasources/remote_datasource/remote_datasource_impl.dart';
import 'package:coding_test/data/repositories/repository.dart';
import 'package:coding_test/data/repositories/repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../core/network/api_base_helper.dart';
import '../core/network/dio_factory.dart';

final locator  = GetIt.instance;

void setup() {
  locator.registerSingleton(DioFactory());
  locator.registerSingleton(ApiBaseHelper(dioFactory: locator()));
  locator.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(helper: locator()));
  locator.registerFactory<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()));
  locator.registerLazySingleton<Repository>(() => RepositoryImpl(
    remoteDataSource: locator(),
    networkInfo: locator(),
  ),
  );
}