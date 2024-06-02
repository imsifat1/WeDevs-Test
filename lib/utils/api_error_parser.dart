import 'dart:convert';
import 'package:http/http.dart';

String? parseError(Response? response) {

  if(response == null) return null;

  if(response.statusCode == 401) {

    try {
      var data = json.decode(response.body);

      if(data == null || data['message'] == null) return null;

      if(data['message'] is String) {
        return data['message'].toString();
      }

      if(data['message'] is Map) {

        var keys = (data['message'] as Map<String, dynamic>).keys;

        if(keys.isNotEmpty && data['message'][keys.first] is List && data['message'][keys.first].isNotEmpty) {
          return data['message'][keys.first][0].toString();
        }
      }
    }
    catch(error) {
      return null;
    }
  }

  if(response.statusCode == 404) {

    try {
      var data = json.decode(response.body);

      if(data == null || data['message'] == null) return null;

      if(data['message'] is String) {
        return data['message'].toString();
      }

      if(data['message'] is Map) {

        var keys = (data['message'] as Map<String, dynamic>).keys;

        if(keys.isNotEmpty && data['message'][keys.first] is List && data['message'][keys.first].isNotEmpty) {
          return data['message'][keys.first][0].toString();
        }
      }
    }
    catch(error) {
      return null;
    }
  }

  if(response.statusCode == 422) {

    try {
      var data = json.decode(response.body);

      if(data == null || data['message'] == null) return null;

      if(data['message'] is String) {
        return data['message'].toString();
      }

      if(data['message'] is Map) {

        var keys = (data['message'] as Map<String, dynamic>).keys;

        if(keys.isNotEmpty && data['message'][keys.first] is List && data['message'][keys.first].isNotEmpty) {
          return data['message'][keys.first][0].toString();
        }
      }
    }
    catch(error) {
      return null;
    }
  }

  if(response.statusCode == 500) {

    try {
      var data = json.decode(response.body);

      if(data == null || data['status'] == null || data['message'] == null) return null;

      if(!data['status'] && data['message'] is String) {
        return data['message'].toString();
      }
    }
    catch(error) {
      return null;
    }
  }

  try {
    var data = json.decode(response.body);

    if(data == null || data['message'] == null) return null;

    if(data['message'] is String) {
      return data['message'].toString();
    }
  }
  catch(error) {
    return null;
  }

  return null;
}