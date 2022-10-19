class AppConstant {
  static const DIO_CLIENT_DEBUG_LOG = true;
  static const String poppinsFont = 'Poppins';
  static String get baseUrl => realeaseMode ? baseApiVJAA : baseApiHisoft;
}

const realeaseMode = false;
const baseApiHisoft = 'https://docgatewayapi.hisoft.vn/';
const baseApiVJAA = 'https://docgatewayapi.vjaa.edu.vn/';
