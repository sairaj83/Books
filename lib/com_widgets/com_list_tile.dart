import 'package:books/utilities/colors.dart';
import 'package:flutter/material.dart';

class ComListTile extends StatelessWidget {
  String? image;
  String? title;
  String? price;
  ComListTile({Key? key, this.image, this.price, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  image!,
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.width * 0.2,
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
                          title!,
                          maxLines: 2,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        Text(
                          price!,
                          maxLines: 1,
                          style: TextStyle(fontSize: 12, color: Colors.grey),
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
            thickness: 1,
          )
        ],
      ),
    );
  }
}
