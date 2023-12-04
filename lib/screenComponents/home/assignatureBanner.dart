import 'package:flutter/material.dart';

class AssignatureBannerHome extends StatelessWidget {
  const AssignatureBannerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              'https://img.freepik.com/psd-gratuitas/modelo-de-banner-de-barbearia_23-2148671093.jpg?w=826&t=st=1701018553~exp=1701019153~hmac=b26489e201dd12cd2ffde05f068e021dc03d534f688c589efee1ed785a7bb91a',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
