import 'package:bloc/bloc.dart';
import 'package:market_app/views/logic/userdata/userdata.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  var client = Supabase.instance.client;
  Userdatamodle userdatamodle = Userdatamodle();

  Future signin(String email, String password) async {
    emit(SigninLoading());
    try {
      await client.auth.signInWithPassword(email: email, password: password);
      await getuserdata();
      emit(SigninSuccess());
    } on AuthException catch (e) {
      emit(SigninFailed(errormessage: e.message));
    }
  }

  Future<dynamic> signup(String username, String email, String password) async {
    emit(SignupLoading());
    try {
      await client.auth.signUp(email: email, password: password);
      await getuserdata();
      emit(SignupSuccess());
      insertdata(username, email);
    } on AuthException catch (e) {
      emit(SignupFailed(errormessage: e.message));
    }
  }

  Future<dynamic> sigout() async {
    emit(SignoutLoading());
    try {
      await client.auth.signOut();
      emit(SignoutSuccess());
    } on AuthException {
      emit(SignoutFailed());
    }
  }

  Future<dynamic> resetpassword(String email) async {
    emit(ResetpasswordLoading());
    try {
      await client.auth.resetPasswordForEmail(email);
      emit(ResetpasswordSuccess());
    } on AuthException {
      emit(ResetpasswordFailed());
    }
  }

  Future<dynamic> insertdata(String username, String email) async {
    emit(InsertdatabaseLoading());
    try {
      await client.from('users').upsert({
        'id': client.auth.currentUser!.id,
        'name': username,
        'email': email,
      });
      emit(InsertdatabaseSuccess());
    } on AuthException {
      emit(InsertdatabaseFailed());
    }
  }

  Future<dynamic> getuserdata() async {
    emit(GetuserdataLoading());
    try {
      final data = await client
          .from('users')
          .select()
          .eq('id', client.auth.currentUser!.id);
      userdatamodle = Userdatamodle(
        email: data[0]['email'],
        name: data[0]['name'],
        id: data[0]['id'],
      );
      emit(GetuserdataSuccess());
    } on AuthException {
      emit(GetuserdataFailed());
    }
  }
}
