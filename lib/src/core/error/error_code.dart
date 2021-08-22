/// local error
final kLocationDisable = {
  'message': 'Location is not enabled.',
  'errorCode': 1,
};
final kLocationDisableForever = {
  'message': 'Location is not enabled. Please go to setting to enable it.',
  'errorCode': 2,
};

/// remote error
final noInternetConnection = {
  '(OS Error: No address associated with hostname, errno = 7)'
};

final kInternetError = {
  'message': 'No internet connection available',
  'errorCode': 51,
};
