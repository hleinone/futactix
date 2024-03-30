part of '../util.dart';

extension ScopeFunctions<T> on T {
  /// Applies the given [function] to this object and returns its result.
  R let<R>(R Function(T) function) {
    return function(this);
  }

  /// Applies the given [function] to this object and returns this object.
  T also(void Function(T) function) {
    function(this);
    return this;
  }
}
