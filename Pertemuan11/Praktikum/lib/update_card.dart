import 'package:flutter/material.dart';
import 'user.dart';

class UpdateCard extends StatelessWidget {
  final UserUpdate userUpdate;
  const UpdateCard({Key? key, required this.userUpdate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.lightGreen[200],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 70,
                child: Text(
                  'Name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 220, child: Text(': ${userUpdate.name}')),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 70,
                child: Text(
                  'Job',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 220, child: Text(': ${userUpdate.job}')),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 70,
                child: Text(
                  'Updated At',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 220, child: Text(': ${userUpdate.updatedAt}')),
            ],
          ),
        ],
      ),
    );
  }
}
