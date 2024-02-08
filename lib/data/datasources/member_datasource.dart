import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_komunitas_app/common/constants/variabels.dart';
import 'package:flutter_komunitas_app/data/models/responses/members_response_model.dart';
import 'package:http/http.dart' as http;

// class MemberDataSource {
//   Future<Either<String, MemberResponModel>> getMember(int filter) async {
//     try {
//       final response = await http.get(Uri.parse(
//           '${Variables.baseUrl}/api/members?filters[no_member]=$filter'),
//           headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       );
//       print(response.statusCode);
//       if (response.statusCode == 200) {
//         return right(MemberResponModel.fromJson(response.body));
//       } else {
//         return const Left('Server Error');
//       }
//     } catch (e) {
//       print('Error: $e');
//       return const Left('An error occurred');
//     }
//   }
// }



class MemberDataSource {
  Future<Either<String, MemberResponModel>> getMember(int filter) async {
    try {
      final response = await http.get(
        Uri.parse(
            '${Variables.baseUrl}/api/members?filters[no_member]=$filter'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        final responseData = response.body;
        if (responseData != null) {
          final Map<String, dynamic> decodedData = json.decode(responseData);
          final memberModel = MemberResponModel.fromMap(decodedData);
          return right(memberModel);
        } else {
          return left('Response body is null');
        }
      } else if (response.statusCode == 404) {
        return left('Data not found');
      } else {
        return left('Server Error');
      }
    } catch (e) {
      print('Error: $e');
      return left('An error occurred: $e');
    }
  }
}






