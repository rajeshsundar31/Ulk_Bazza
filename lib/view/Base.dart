import 'package:flutter/material.dart';
import 'package:ulk_bazza/commoncomponent/Colors.dart';



class ProductBase extends StatefulWidget {
  const ProductBase({super.key});

  @override
  State<ProductBase> createState() => _ProductBaseState();
}

class _ProductBaseState extends State<ProductBase> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CommonColors.white,
          actions: [
            IconButton(onPressed: (){}, 
            icon: const Icon(Icons.shopping_bag, color: CommonColors.grey))
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 5, right: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 200,
                    height: 250,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(100)
                      ),
                      image: DecorationImage(image: AssetImage("lib/assets/images/green.jpg"),
                      )
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 250,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(120)
                      ),
                      image: DecorationImage(image: AssetImage("lib/assets/images/green.jpg"),
                      )
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ));
  }
}

