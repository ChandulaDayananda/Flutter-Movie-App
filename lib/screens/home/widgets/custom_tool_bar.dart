import 'package:flutter/material.dart';

class CustomToolBar extends StatelessWidget {
  const CustomToolBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green.shade900,
        // borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.green,
            ),
          ),
          const Spacer(),
          const Text(
            'Movie Hub ',
            style: TextStyle(
              color: Colors.green,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}