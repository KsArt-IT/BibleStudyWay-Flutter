import 'dart:developer';

import 'package:core_common/common.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

mixin SafeCallMixin {
  Future<Result<T>> safeCall<T>(AsyncValueGetter<T> invoke) async {
    try {
      return success(await invoke());
    } on FirebaseAuthException catch (e, stackTrace) {
      return failure(AuthFailure(e.toString(), stackTrace, code: e.code));
    } on FirebaseException catch (e, stackTrace) {
      return failure(DataFailure(e.toString(), stackTrace, code: e.code));
    } on AppFailure catch (e) {
      log(e.message);
      return failure(e);
    } catch (e, stackTrace) {
      log(e.toString());
      return failure(GeneralFailure(e.toString(), stackTrace));
    }
  }

  Future<Result<void>> voidSafeCall(AsyncCallback invoke) async {
    try {
      await invoke();
      return success(null);
    } on FirebaseAuthException catch (e, stackTrace) {
      return failure(AuthFailure(e.toString(), stackTrace, code: e.code));
    } on FirebaseException catch (e, stackTrace) {
      return failure(DataFailure(e.toString(), stackTrace, code: e.code));
    } on AppFailure catch (e) {
      return failure(e);
    } catch (e, stackTrace) {
      log(e.toString());
      return failure(GeneralFailure(e.toString(), stackTrace));
    }
  }
}
