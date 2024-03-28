part of '../util.dart';

extension IterableExtensions<E> on Iterable<E> {
  Iterable<E> intersperse(E separator) {
    return expand((element) sync* {
      yield separator;
      yield element;
    }).skip(1);
  }
}
