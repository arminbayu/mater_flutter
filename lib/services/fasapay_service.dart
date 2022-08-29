import 'package:crypto/crypto.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

import 'package:master/helpers/local_helper.dart';
import 'package:master/config/index.dart';

import 'dart:convert';

class FasapayServices {
  static createToken(String api_key, String api_secretword) {
    var dateUtc = DateTime.now().toUtc();
    String dateFormat = DateFormat('yyyyMMddkk').format(dateUtc);
    var str = api_key + ":" + api_secretword + ":" + dateFormat;

    var hashed = utf8.encode(str);
    var hashing = sha256.convert(hashed);

    return "$hashing";
  }

  static buildAuth(String api_key, String token) {
    var str = '<auth><api_key>$api_key</api_key><token>$token</token></auth>';
    return str;
  }

  static xmlAuth() async {
    var api_key = "bd2cb750a9f450c1413f00e1ec53f636";
    var api_secretword = "apitriv";
    var token = createToken(api_key, api_secretword);
    var auth = buildAuth(api_key, token);
    return auth;
  }

  static transfer(
    String to,
    String amount,
    String currency,
    String fee_mode,
    String note,
  ) async {
    var xml = '<fasa_request>' +
        await xmlAuth() +
        '<transfer>' +
        '<to>$to</to>' +
        '<amount>$amount</amount>' +
        '<currency>$currency</currency>' +
        '<fee_mode>$fee_mode</fee_mode>' +
        '<note>$note</note>' +
        '</transfer>' +
        '</fasa_request>';
    return await getResponse(xml);
  }

  static history(
    String start_date,
    String end_date,
    String type,
    String order_by,
    String order,
    String page,
    String perPage,
  ) async {
    var xml = '<fasa_request>' +
        await xmlAuth() +
        '<history>' +
        '<start_date>$start_date</start_date>' +
        '<end_date>$end_date</end_date>' +
        '<type>$type</type>' +
        '<order_by>$order_by</order_by>' +
        '<order>$order</order>' +
        '<page>$page</page>' +
        '<page_size>$perPage</page_size>' +
        '</history>' +
        '</fasa_request>';

    return await getResponse(xml);
  }

  static detail(String batchnumber) async {
    var xml = '<fasa_request>' +
        await xmlAuth() +
        '<detail>$batchnumber</detail>' +
        '</fasa_request>';

    return await getResponse(xml);
  }

  static balance() async {
    var xml = '<fasa_request>' +
        await xmlAuth() +
        '<balance>USD</balance>' +
        '<balance>IDR</balance>' +
        '</fasa_request>';

    return await getResponse(xml);
  }

  static account(String account) async {
    var xml = '<fasa_request>' +
        await xmlAuth() +
        '<account>$account</account>' +
        '</fasa_request>';
    return await getResponse(xml);
  }

  static kursRequest(
    String exbank, // panin
    String excurrency, // USD
  ) async {
    var xml = '<fasa_request>' +
        await xmlAuth() +
        '<exrate>' +
        '<exbank>$exbank</exbank>' +
        '<excurrency>$excurrency</excurrency>' +
        '</exrate>' +
        '</fasa_request>';

    return await getResponse(xml);
  }

  static getResponse(xml) async {
    try {
      Xml2Json xml2json = Xml2Json();
      final response = await http.post(
        Uri.parse(url_master),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        encoding: Encoding.getByName('utf-8'),
        body: {"req": xml},
      );

      if (response.statusCode == 200) {
        xml2json.parse(response.body);
        var message = xml2json.toParkerWithAttrs();
        Map<String, dynamic> respon = jsonDecode(message);
        return respon;
      } else {
        return 'Error Server';
      }
    } catch (e) {
      return 'Time Out';
    }
  }
}
