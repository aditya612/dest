// import 'package:flutter/foundation.dart';

// https://stackoverflow.com/questions/38908285/add-methods-or-values-to-enum-in-dart
// https://stackoverflow.com/questions/15854549/how-can-i-build-an-enum-with-dart/15854550#15854550
// enum Method {
//   GET,
//   POST,
// }

// extension SelectedColorExtension on Method {
//   String get name => describeEnum(this);
//   String get displayTitle {
//     switch (this) {
//       case Method.GET:
//         return 'This is the Primary Color';
//       case Method.POST:
//         return 'This is the Secondary Color';
//       default:
//         return 'SelectedScheme Title is null';
//     }
//   }
// }

/// Emulation of Java Enum class.
///
/// Example:
///
/// class Meter<int> extends Enum<int> {
///
///  const Meter(int val) : super (val);
///
///  static const Meter HIGH = const Meter(100);
///  static const Meter MIDDLE = const Meter(50);
///  static const Meter LOW = const Meter(10);
/// }
///
/// and usage:
///
/// assert (Meter.HIGH, 100);
/// assert (Meter.HIGH is Meter);
// abstract class Enum<T> {
//   final T _value;

//   const Enum(this._value);

//   T get value => _value;
// }

// class Method<String> extends Enum<String> {
//   const Method(String value) : super(value);

//   static const Method GET = const Method('GET');
//   static const Method POST = const Method('POST');
// }
