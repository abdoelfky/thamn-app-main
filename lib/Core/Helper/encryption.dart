part of core;

class EncryptionX{
  static String toMd5(String value) {
    return md5.convert(utf8.encode(value)).toString();
  }
}