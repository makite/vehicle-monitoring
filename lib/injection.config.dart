// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/services/api_client.dart' as _i4;
import 'core/services/firebase_module.dart' as _i7;
import 'features/dashboard/data/datasource/vehicle_datasource.dart' as _i6;
import 'features/dashboard/presentation/manager/dashboard_bloc.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseModule = _$FirebaseModule();
    gh.factory<_i3.DashboardBloc>(() => _i3.DashboardBloc());
    gh.singleton<_i4.ApiClient>(() => _i4.ApiClient());
    gh.lazySingleton<_i5.FirebaseFirestore>(
        () => firebaseModule.firebaseFirestore);
    gh.factory<_i6.VehicleRemoteDataSource>(
        () => _i6.VehicleRemoteDataSourceImpl(gh<_i5.FirebaseFirestore>()));
    return this;
  }
}

class _$FirebaseModule extends _i7.FirebaseModule {}
