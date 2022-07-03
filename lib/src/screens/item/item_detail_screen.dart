import 'package:flutter/material.dart';
import 'package:food_app/core/constants/app_colors.dart';

import '../../model/item.dart';

class MenuItemScreen extends StatefulWidget {
  MenuItemScreen({
    Key? key,
    required this.item,
  }) : super(key: key);
  final Item item;

  @override
  State<MenuItemScreen> createState() => _MenuItemScreenState();
}

class _MenuItemScreenState extends State<MenuItemScreen> {
  int itemNo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.themePrimary,
        title: Text(
          widget.item.name,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              widget.item.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              children: [
                const Icon(
                  Icons.star_rounded,
                  color: Colors.orange,
                ),
                Text(
                  widget.item.description + " | " + widget.item.status,
                  style: const TextStyle(color: Colors.grey),
                ),
                // OutlinedButton(
                //   onPressed: () {},
                //   child: const Text(
                //     "Share",
                //     style: TextStyle(color: Colors.black),
                //   ),
                // )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Text(
                  "Item",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                Spacer(),
                Text(
                  "Price",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Divider(
            height: 0,
          ),
          Price(
            size: "Orders",
            price: 30,
            itemNo: itemNo,
            plus: () {
              setState(() {
                itemNo++;
              });
            },
            minus: () {
              setState(() {
                itemNo--;
              });
            },
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  width: 30,
                  height: 30,
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        itemNo--;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: const Icon(
                      Icons.remove,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.orange,
                    ),
                  ),
                  child: Center(child: Text(itemNo.toString())),
                ),
                Container(
                  width: 30,
                  height: 30,
                  child: OutlinedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      setState(() {
                        itemNo++;
                      });
                    },
                    child: const Icon(
                      Icons.add,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                Spacer(),
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    "Add to Cart",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.black)),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Order",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: AppColor.themePrimary, elevation: 0),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Price extends StatelessWidget {
  Price({
    Key? key,
    required this.size,
    required this.price,
    required this.plus,
    required this.itemNo,
    required this.minus,
  }) : super(key: key);
  String? size;
  int? price;
  int itemNo;
  Function plus;
  Function minus;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: 80,
            child: Text(
              size!,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Spacer(),
          Text(
            price.toString() + '\$',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          Spacer(),
          SizedBox(
            width: 30,
            height: 30,
            child: OutlinedButton(
              onPressed: () {
                minus();
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              child: const Icon(
                Icons.remove,
                size: 20,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Colors.orange,
              ),
            ),
            child: Center(child: Text(itemNo.toString())),
          ),
          Container(
            width: 30,
            height: 30,
            child: OutlinedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              onPressed: () {
                plus();
              },
              child: const Icon(
                Icons.add,
                size: 20,
                color: Colors.black,
              ),
            ),
          ),
          Spacer(),
          OutlinedButton(
            onPressed: () {},
            child: Text(
              "Add to cart",
              style: TextStyle(color: Colors.black),
            ),
            style:
                OutlinedButton.styleFrom(side: BorderSide(color: Colors.black)),
          )
        ],
      ),
    );
  }
}
