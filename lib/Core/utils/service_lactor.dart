import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_chat/Core/services/firebase_service.dart';
import 'package:fire_chat/Featured/Auth/data/repositories/auth_repo_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

void setupGetIt() async {
  getIt.registerSingleton<FirebaseAuthService>(
      FirebaseAuthService(FirebaseAuth.instance));
  getIt.registerLazySingleton<CollectionReference>(
    () => FirebaseFirestore.instance.collection('users'),
    instanceName: 'users',
  );
  getIt.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());
  getIt.registerSingleton<AuthRepoImpl>(
      AuthRepoImpl(getIt.get<FirebaseAuthService>()));
}
