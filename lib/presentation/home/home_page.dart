import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_komunitas_app/common/constants/colors.dart';
import 'package:flutter_komunitas_app/presentation/auth/pages/login_page.dart';
import 'package:flutter_komunitas_app/presentation/home/widgets/member_card.dart';

import 'bloc/bloc/member_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        // title: Text('Your App Title'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Color.fromARGB(255, 0, 65, 117),
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
            );
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 250,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
              color: Color.fromARGB(255, 0, 65, 117),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 65),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        controller: searchController,
                        decoration: const InputDecoration(
                          hintText: 'Masukan ID Anggota',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextButton(
                    onPressed: () {
                      final memberId = int.parse(searchController.text);
                      context.read<MemberBloc>().add(MemberEvent.getMember(memberId));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorName.yellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      fixedSize: const Size(200, 45),
                    ),
                    child: const Text(
                      'Cari',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          // BlocBuilder<MemberBloc, MemberState>(
          //   builder: (context, state) {
          //     return state.maybeWhen(
          //       orElse: () {
          //         return const Center(
          //           child: CircularProgressIndicator(),
          //         );
          //       },
          //       loading: () {
          //         // Tambahkan loading case di sini
          //         return const Center(
          //           child: CircularProgressIndicator(),
          //         );
          //       },
          //       loaded: (model) {
          //         return Expanded(
          //             child: ListView.builder(
          //           itemCount: model.data.length,
          //           itemBuilder: (context, index) => Padding(
          //             padding: const EdgeInsets.symmetric(vertical: 10.0),
          //             child: MemberCard(
          //               data: model.data[index],
          //             ),
          //           ),
          //         ));
          //       },
          //     );
          //   },
          // ),
          BlocBuilder<MemberBloc, MemberState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                loaded: (model) {
                  if (model.data.isEmpty) {
                    return const Center(
                      child: Text('Member Belum Terdaftar!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black ) ,),
                    );
                  }
                  return Expanded(
                    child: ListView.builder(
                      itemCount: model.data.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: MemberCard(
                          data: model.data[index],
                        ),
                      ),
                    ),
                  );
                },
                error: (message) {
                  return Center(
                    child: Text(message),
                  );
                },
              );
            },
          ),

        ],
      ),
    );
  }
}
