class MenuItemScreen extends StatelessWidget {
  const MenuItemScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Zinger Burger"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            child: const FlutterLogo(),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              children: [
                const Icon(
                  Icons.star_rounded,
                  color: Colors.orange,
                ),
                const Text(
                  "4.5  (Based on 100 Reviews)",
                  style: const TextStyle(color: Colors.grey),
                ),
                const Spacer(),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text(
                    "Share",
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Text(
                  "Sizes",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  "Price",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Divider(
            height: 0,
          ),
          Price(
            size: "Small",
            price: 30,
          ),
          Divider(
            height: 0,
          ),
          Price(
            size: "Medium",
            price: 40,
          ),
          Divider(
            height: 0,
          ),
          Price(
            size: "Large",
            price: 50,
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
                    onPressed: () {},
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
                  child: const Center(child: Text("2")),
                ),
                Container(
                  width: 30,
                  height: 30,
                  child: OutlinedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {},
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
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.black)),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Order"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black, elevation: 0),
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
  Price({Key? key, required this.size, required this.price}) : super(key: key);
  String? size;
  int? price;
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
              style: TextStyle(fontSize: 18),
            ),
          ),
          Spacer(),
          Text(price.toString()),
          Spacer(),
          SizedBox(
            width: 30,
            height: 30,
            child: OutlinedButton(
              onPressed: () {},
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
            child: const Center(child: Text("2")),
          ),
          Container(
            width: 30,
            height: 30,
            child: OutlinedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              onPressed: () {},
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
