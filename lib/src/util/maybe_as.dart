part of '../util.dart';

extension MaybeAs on Object {
  T? maybeAs<T>() => this is T ? this as T : null;
}
