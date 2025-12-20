import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart';

// ============================================================
// Internal API for EasyDateTime static methods
// ============================================================
// These functions are used by EasyDateTime's static methods to avoid
// triggering deprecation warnings internally.

/// Cached initialization status to avoid repeated checks.
bool? _timeZoneInitialized;

/// Internal: Initializes the IANA timezone database.
void internalInitializeTimeZone() {
  tz.initializeTimeZones();
  _timeZoneInitialized = true;
}

/// Internal: Checks if the timezone database has been initialized.
///
/// Uses caching to avoid repeated `getLocation` calls after first check.
bool get internalIsTimeZoneInitialized {
  if (_timeZoneInitialized == true) return true;
  try {
    getLocation('UTC');
    _timeZoneInitialized = true;

    return true;
  } catch (_) {
    return false;
  }
}
