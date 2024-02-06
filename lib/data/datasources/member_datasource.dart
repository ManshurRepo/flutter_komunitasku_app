import 'package:dartz/dartz.dart';
import 'package:flutter_komunitas_app/common/constants/variabels.dart';
import 'package:flutter_komunitas_app/data/models/responses/members_response_model.dart';
import 'package:http/http.dart' as http;

class MemberDataSource {
  Future<Either<String, MemberResponModel>> getAllMember() async {
    final response = await http
        .get(Uri.parse('${Variables.baseUrl}/api/members?populate=*'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      return Right(MemberResponModel.fromJson(response.body));
    } else {
      return const Left('Server Error');
    }
  }
}
