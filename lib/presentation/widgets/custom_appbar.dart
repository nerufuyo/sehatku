import 'package:flutter/material.dart';
import 'package:sehatku/presentation/style/pallet.dart';

AppBar customAppBar({required menuOnPressed}) {
  return AppBar(
    backgroundColor: white0,
    elevation: 0,
    leading: IconButton(
      onPressed: menuOnPressed,
      icon: const Icon(Icons.menu, color: primary),
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.shopping_cart_rounded, color: primary),
      ),
      IconButton(
        onPressed: () {},
        icon: Stack(
          children: [
            const Icon(Icons.notifications, color: primary),
            Positioned(
              top: 2,
              right: 2,
              child: Container(
                height: 10,
                width: 10,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(color: white0),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
          ],
        ),
      ),
    ],
  );
}
