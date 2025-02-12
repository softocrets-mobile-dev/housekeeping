import 'dart:convert';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart' as cryptography;
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:housekeeping_pro/env/env.dart';

class EncryptionDecryptionAlgo {
  //Singleton factory
  static final EncryptionDecryptionAlgo _instance =
      EncryptionDecryptionAlgo._internal();

  factory EncryptionDecryptionAlgo() {
    return _instance;
  }

  EncryptionDecryptionAlgo._internal();

/*
  Tuple2<String?, String?> decryptPassword(String encryptedText) {
    try {
      final salt = utf8.encode(saltKey);
      final key = encrypt.Key.fromUtf8(_generateKey(secretKey, salt)
          .substring(0, 32)); // Ensure key is 32 bytes
      final encryptedData = base64.decode(encryptedText);

      final iv = encrypt.IV(encryptedData.sublist(0, 16));
      final ciphertext = encryptedData.sublist(16);

      final decryption = encrypt.Encrypter(
          encrypt.AES(key, mode: encrypt.AESMode.cbc, padding: 'PKCS7'));
      final decrypted =
          decryption.decryptBytes(encrypt.Encrypted(ciphertext), iv: iv);

      final decryptedText = utf8.decode(decrypted);

      if (decryptedText.isEmpty) {
        return Tuple2(null, 'Error decrypting password');
      }

      return Tuple2(decryptedText, null);
    } catch (error) {
      return Tuple2(null, 'Error decrypting password');
    }
  }

  Tuple2<String?, String?> encryptPassword({required String plainText}) {
    try {
      final salt = utf8.encode(saltKey);
      final key = encrypt.Key.fromUtf8(_generateKey(secretKey, salt)
          .substring(0, 32)); // Ensure key is 32 bytes

      final iv = encrypt.IV.fromSecureRandom(16); // Use secure random IV

      final encryption = encrypt.Encrypter(
          encrypt.AES(key, mode: encrypt.AESMode.cbc, padding: 'PKCS7'));
      final encrypted = encryption.encrypt(plainText, iv: iv);

      final encryptedData = iv.bytes + encrypted.bytes;
      final encryptedBase64 = base64.encode(encryptedData);
      if (encryptedBase64.isEmpty) {
        return Tuple2(null, 'Error encrypting password');
      }
      return Tuple2(encryptedBase64, null);
    } catch (error) {
      return Tuple2(null, 'Error encrypting password');
    }
  }

  static String _generateKey(String secretKey, List<int> salt) {
    final key = pbkdf2(
      secretKey,
      salt,
      65536,
      32,
      sha256,
    );
    return base64.encode(key);
  }

  static List<int> pbkdf2(String password, List<int> salt, int iterations,
      int keyLength, Hash hash) {
    final hmac = Hmac(hash, utf8.encode(password));
    var derivedKey = List<int>.filled(keyLength, 0);
    var blockSize = hmac.convert([]).bytes.length;
    var blockCount = (keyLength + blockSize - 1) ~/ blockSize;

    for (var i = 1; i <= blockCount; i++) {
      var u = hmac.convert(salt + _intToBytes(i)).bytes;
      var t = u;

      for (var j = 1; j < iterations; j++) {
        u = hmac.convert(u).bytes;
        for (var k = 0; k < t.length; k++) {
          t[k] ^= u[k];
        }
      }

      final blockSize = hmac.convert([]).bytes.length;
      derivedKey.setRange((i - 1) * blockSize, i * blockSize, t);
    }

    return derivedKey;
  }

  static List<int> _intToBytes(int i) {
    var bytes = List<int>.filled(4, 0);
    bytes[0] = (i >> 24) & 0xff;
    bytes[1] = (i >> 16) & 0xff;
    bytes[2] = (i >> 8) & 0xff;
    bytes[3] = i & 0xff;
    return bytes;
  }
*/

  Future<String?> getEncryptedPassword({required String password}) async {
    try {
      final keyBytes = await _generateKey();
      final key = encrypt.Key(Uint8List.fromList(keyBytes));
      final iv = encrypt.IV.fromSecureRandom(16);
      final encrypter =
          encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));
      final encrypted = encrypter.encrypt(password, iv: iv);
      final combined = iv.bytes + encrypted.bytes;
      return base64.encode(combined);
    } catch (error) {
      return 'Error encrypting password';
    }
  }

  static Future<List<int>> _generateKey() async {
    final pbkdf2 = cryptography.Pbkdf2(
      macAlgorithm: cryptography.Hmac.sha256(),
      iterations: 65536,
      bits: 256,
    );
    final secretKey = cryptography.SecretKey(
      utf8.encode(
        Env.secretKey,
      ),
    );
    final newSecretKey = await pbkdf2.deriveKey(
      secretKey: secretKey,
      nonce: utf8.encode(Env.saltKey),
    );
    return await newSecretKey.extractBytes();
  }
}
