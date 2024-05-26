import 'dart:developer';

import 'package:googleapis_auth/auth_io.dart';

class NotificationAccessToken {
  static String? _token;

  //to generate token only once for an app run
  static Future<String?> get getToken async => _token ?? await _getAccessToken();

  // to get admin bearer token
  static Future<String?> _getAccessToken() async {
    try {
      const fMessagingScope =
          'https://www.googleapis.com/auth/firebase.messaging';

      final client = await clientViaServiceAccount(
        // To get Admin Json File: Go to Firebase > Project Settings > Service Accounts
        // > Click on 'Generate new private key' Btn & Json file will be downloaded

        // Paste Your Generated Json File Content
        ServiceAccountCredentials.fromJson(
            {
              "type": "service_account",
              "project_id": "kojena-backend",
              "private_key_id": "af5bdd7c5b0b1fffb09fc77dd15d79b0333d6674",
              "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCyxXx0SOxbtQwF\nuFEDNa5OvJOIXuUxl2dVE55MIVN4w2QQoaev451MV90OqsNBgXVrtI0Fbbgw5fQr\nHFa53rY48qGDISRrXr0usuU9EiGN4O1LKUIhiuTdZfROtupcnRK7ejDkFQYjZMlw\nli9GbMWZWVjwZM2f+4KiAn+vqfsL2L2GXUAqqIg5FmKOiJt7mWU4QEECzmIqq49u\n5ZFe2Zxu9ScIzURDTDqGtq4h1xbAhK2kC4v3I/MkdD2o2m+kXrUczE3e4bx0JZY1\niw0ejGFjTCN99mHrRP7FAoHhENSo5RislS4qGBkSPBwim5QkPGJXuJV4d3tIMzUh\nM0sYUvdlAgMBAAECggEACoFi9yVq6Fe7EWH7tsPSjrNzuwWSk+e5DY2V1ZT2xge7\na2PIiiRG09vs9GXyC/kq2I23ZMyGEK+OufLUIN+W10Fg3ucVcA7U8LfYE07rtF31\nq99MkNKL8PvDD9YdbxxW47gCRAD9R5quYMSemhWdxg1zVcsir0ZVLqaVcNH9G/zC\n6Fna/alf4NwMJfjI+0NHTuhwWByGZERKrj3Tio2ctdY7Cx+n3frAMH7Z7VJQeIv0\ntCKIUnZ//DEL2zwcgTGPZZrwdz8LxxkMwBgxLo1TrmED6gx65JLwikvX6SNnZ57d\nPxWR9auVUJJ8yJ0Mwdh99j4bUnkfxgKz/a42/nBJoQKBgQD8NpgedrbFBXvJr+Bj\nb44DW2zl4amo6W6yHAiSwrSXHw0CfuLhAY5hd/QfWmsxhxFg+50RtM9s1PopDUnJ\nb/1JhhNq/55Q1cHWR1NuROcdwHrWZSD4U5KaetAQtjxws1ThNsSDGQ9nRAzKo/Ay\nt7anIUUzMdattgStMxsuvsDuIQKBgQC1dJx6W9QDf2MGrhqSA3xL9t29+EndWKgr\nm9lWINQ5JaJ0cpqa/Am23+2FNlBXCJkwPDMWd+sah7XE459sXtGNaXc5TnhY2PI+\nDSns8D7VA1af1Wvopmo2V5DNQ+9kTnwiZFyfN/NO5samuMKngkZ+/XrOzXhSY7xu\ni6b2xDS4xQKBgCFG9sU2NqFCOvX+faXBB0TMIE8oeiEuQ4u+hScQB5HU5/uHUFoN\nwYJ8uDoWzQPo5VMdf7jhWWjrpOIbvbuVSh8UUKWSeooB2iRynsBy2OelCNAW4cXC\nCRrWz3MVCF56Wt2oQz9k5BJk+ScXgE7AzJm6mw3JKqEa3f0YPCLryjrhAoGAX7c1\nW23Y9kdZ6wonxeHEzSVZbn3sKLA9dVNuX3pNuB9cBGT3nM1aKncQiXZPBrnoZIM8\nx5tWDtaLUWJok/eoPhnl4/q6jNNTZNv4w50u55otNX6Uv1IZMLUcEsrFGno0DMg3\n+1y+IV6mZweK1mVn3lDDWRcVYxBtMzrDRePVk6kCgYEAhh9AGNITSdVwTqp1QY1y\n51hB76z2kHxAAdjj4dr1TJkWCP2AReXpXvnKKDkaUKRmub0NGAmL3TH73UprYtxC\n3Qeaq7DdE2x+Tw/9MtZSs4N+osEPc4PJP7m0DfOCZOFjJox0ji3gKj4qWJRNoOKj\nv2ygFSTWhXGRtiDLCDx1+Ak=\n-----END PRIVATE KEY-----\n",
              "client_email": "firebase-adminsdk-91lpa@kojena-backend.iam.gserviceaccount.com",
              "client_id": "103787660279741992101",
              "auth_uri": "https://accounts.google.com/o/oauth2/auth",
              "token_uri": "https://oauth2.googleapis.com/token",
              "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
              "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-91lpa%40kojena-backend.iam.gserviceaccount.com",
              "universe_domain": "googleapis.com"
            }
            ),
        [fMessagingScope],
      );

      _token = client.credentials.accessToken.data;

      return _token;
    } catch (e) {
      log('$e');
      return null;
    }
  }
}
