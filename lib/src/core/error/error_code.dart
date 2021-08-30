/// local error
final kLocationDisable = {
  'message': 'Location is not enabled.',
  'errorCode': 1,
};
final kLocationDisableForever = {
  'message': 'Location is not enabled. Please go to setting to enable it.',
  'errorCode': 1,
};
final kReadDatabaseFailed = {
  'message': 'Read database failed. Try again later.',
  'errorCode': 2,
};

/// remote error

class RemoteErrorCode {
  static const INTERNET_ERROR_CODE = 51;
  static const CONNECTION_INTERUPTED_ERROR_CODE = 52;

  static final List<Map<String, Object>> remoteErrors = [
    {
      'rawMessage':
          '(OS Error: No address associated with hostname, errno = 7)',
      'message':
          'No internet connection available. Please pconnect to the internet.',
      'errorCode': INTERNET_ERROR_CODE,
    },
    {
      'rawMessage':
          '(OS Error: No address associated with hostname, errno = 8)',
      'message':
          'No internet connection available. Please pconnect to the internet.',
      'errorCode': INTERNET_ERROR_CODE,
    },
    {
      'rawMessage': 'Connection closed while receiving data',
      'message': 'Connection interupted. Please reconnect to the internet.',
      'errorCode': CONNECTION_INTERUPTED_ERROR_CODE,
    }
  ];
}
