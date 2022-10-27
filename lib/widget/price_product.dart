import 'package:flutter/material.dart';

class PriceItem extends StatelessWidget {
  const PriceItem({
    required this.imageUrl,
    required this.price,
    required this.siteName,
    Key? key,
  }) : super(key: key);

  final String siteName;
  final String imageUrl;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
        leading: Container(
          width: 45,
          height: 45,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            width: 45,
            height: 45,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        title: Row(children: [
          Text(
            '$siteName EG',
            style: TextStyle(
                fontSize: 13,
                color: Color(0xff54328E),
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 10,
          ),
          Image.asset(
            'assets/images/In_stock.png',
          )
        ]),
        trailing: Text(
          '$price EGP',
          style: TextStyle(
              fontSize: 15,
              color: Color(0xff54328E),
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
