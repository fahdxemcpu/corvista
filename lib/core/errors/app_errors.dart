import 'package:flutter/services.dart';

import 'error_log.dart';

/// Error codes used by the native bridge (docs/BRIDGE.md).
abstract final class BridgeErrorCode {
  static const badArgs = 'bad_args';
  static const permissionDenied = 'permission_denied';
  static const unavailable = 'unavailable';
  static const notRunning = 'not_running';
  static const ioError = 'io_error';
  static const storageFull = 'storage_full';
  static const modelError = 'model_error';
  static const cancelled = 'cancelled';
  static const failed = 'failed';
}

/// Normalised error code for anything thrown by the bridge. Returns one of the
/// [BridgeErrorCode] values, or `failed` for unknown errors.
///
/// Controllers call this (or [errorMessage]) in their catch blocks, so
/// `PlatformException`s are also written to the private [ErrorLog].
String errorCode(Object error) {
  if (error is PlatformException) {
    ErrorLog.instance?.recordCaught(error);
    return error.code;
  }
  if (error is MissingPluginException) return BridgeErrorCode.unavailable;
  return BridgeErrorCode.failed;
}

/// Human-readable message (native message when present, else the code).
String errorMessage(Object error) {
  if (error is PlatformException) {
    ErrorLog.instance?.recordCaught(error);
    return error.message ?? error.code;
  }
  return error.toString();
}
