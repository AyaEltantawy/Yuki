import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yuki/core/theming/colors.dart';
import 'package:yuki/core/theming/styles.dart';

class ShoppingCart extends StatelessWidget {
  final bool isDelete;
  final String? name;
  final num? price;
final String? imageUrl;
  ShoppingCart({super.key, required this.isDelete, this.name, this.price,this.imageUrl});

  int count = 1;

  void increament() {
    count++;
  }

  void decreament() {
    if (count > 1) {
      count--;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: ColorsManager.seconderyblue,
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                    spreadRadius: 0, blurRadius: 48, color: Color(0x0000000D))
              ]),
          child: StatefulBuilder(builder:
              (BuildContext context, void Function(void Function()) setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.remove,
                    size: 17,
                  ),
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      decreament();
                    });
                  },
                ),

                Text(
                  "$count",
                  style: const TextStyle(color: Colors.white),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.add,
                    size: 17,
                  ),
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      increament();
                    });
                  },
                ),
                //SizedBox(width: 5,),
              ],
            );
          }),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: ColorsManager.grey,
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 48,
                    spreadRadius: 0,
                    color: Color(0x0000000D),
                    offset: Offset(0, 2),
                    blurStyle: BlurStyle.outer,
                  )
                ]),
            child: Padding(
              padding: EdgeInsets.only(left: 7, top: 5.h, bottom: 5.h),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(imageUrl??''),
                  SizedBox(
                    width: 10.w,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(name ?? '',
                            style: TextStyles.font16Black700Weight),
                        SizedBox(
                          height: 10.h,
                        ),
                        RichText(
                            text: TextSpan(
                                text: "Price :",
                                style: TextStyles.font13Black400Weight,
                                children: [
                              TextSpan(
                                  text: "$price",
                                  style: TextStyles.font13Mainblue700Weight),
                            ])),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 53.h),
                    child: isDelete
                        ? IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.delete,
                              color: ColorsManager.red,
                            ))
                        : null,
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
