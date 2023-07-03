import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_chat/Core/services/firebase_service.dart';
import 'package:fire_chat/Featured/Auth/data/repositories/auth_repo_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthService>(
      FirebaseAuthService(FirebaseAuth.instance));
  getIt.registerLazySingleton<CollectionReference>(
    () => FirebaseFirestore.instance.collection('users'),
    instanceName: 'users',
  );
  getIt.registerSingleton<AuthRepoImpl>(
      AuthRepoImpl(getIt.get<FirebaseAuthService>()));
}
