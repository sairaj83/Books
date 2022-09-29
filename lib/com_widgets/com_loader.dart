import 'package:books/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ComLoaderextends extends StatelessWidget {
  const ComLoaderextends({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.width * 0.2,
                    color: Colors.grey,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'loading......',
                          maxLines: 2,
                        ),
                        Text(
                          'loading...',
                          maxLines: 2,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: maincolor,
              )
            ],
          ),
          Divider(
            color: maincolor,
          )
        ],
      ),
    );
  }
}
