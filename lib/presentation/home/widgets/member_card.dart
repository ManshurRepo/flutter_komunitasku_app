import 'package:flutter/material.dart';
import 'package:flutter_komunitas_app/common/constants/colors.dart';

import 'package:flutter_komunitas_app/data/models/responses/members_response_model.dart';

import '../../../common/constants/variabels.dart';

class MemberCard extends StatelessWidget {
  final Member data;

  const MemberCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[200],
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 0, 65, 117),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(2, 0),
          )
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Center di sekitar ClipRRect
          Center(
            child: Container(
              width: 100,
              height: 100,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.orange,
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(1, 1),
                  )
                ],
              ),
              // child: ClipRRect(
              //   borderRadius: BorderRadius.circular(50),
              //   child: Image.asset(
              //     'assets/images/profil.png',
              //     fit: BoxFit.fill,
              //   ),
              //   // child: Image.asset(
              //   //   'assets/images/profil.png',
              //   //   width: 170.0,
              //   //   height: 112.0,
              //   //   fit: BoxFit.cover,
              //   // ),
              // ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Nama: ${data.attributes.nama}',
            style: const TextStyle(fontSize: 20),
          ),
          const Divider(color: Colors.black),
          Text(
            'No Member: ${data.attributes.noMember}',
            style: const TextStyle(fontSize: 20),
          ),
          const Divider(color: Colors.black),
          Text(
            'Alamat: ${data.attributes.alamat}',
            style: const TextStyle(fontSize: 20),
          ),
          const Divider(color: Colors.black),
          Text(
            'No. Telp: ${data.attributes.noTelepon}',
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
