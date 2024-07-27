import 'package:flutter/material.dart';
import 'package:shop_app/colors.dart';
import 'package:shop_app/delivery_info.dart';
import 'package:shop_app/utills.dart';

class ProductCartScreen extends StatefulWidget {
  const ProductCartScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProductCartScreen();
  }
}

class _ProductCartScreen extends State<ProductCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildBackButtonHeader("Cart", () {
              debugPrint("Cart back button is clicked");
              Navigator.of(context).pop();
            }),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 10, 5),
              child: Text(
                'Cart',
                style: TextStyle(
                  color: hexToColor(primaryColor),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const ProductView(),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 30), // simplified padding
                  child: Text(
                    '₹ 1,179',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  child: buildButton(
                    "Proceed to Buy",
                    () {
                      navigateToDeliveryInfoScreen(context);
                    },
                    topMargin: 10,
                    bottomMargin: 10,
                    height: 50,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProductViewState();
  }
}

class _ProductViewState extends State<ProductView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: hexToColor(shopSecondaryCard),
              child: Column(
                children: [
                  productCard(),
                  productCard(),
                  productCard(),
                  const SizedBox(height: 15),
                ],
              ),
            ),
            const SizedBox(height: 5),
            productBill(),
          ],
        ),
      ),
    );
  }
}

Widget productCard() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
    child: Container(
      height: 125,
      width: double.infinity,
      color: hexToColor(shopPrimaryCard),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/productImage.png'),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Lorem Ipsum is simply',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Lorem Ipsum is simply dummy text of the printing.',
                    maxLines: 2,
                    style: TextStyle(fontSize: 11),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        '₹ 1,10,179',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        '₹ 2,20,599',
                        style: TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        color: Colors.red, // Color for discount
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 2),
                        child: const Text(
                          '-30%',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ],
                  ), // Added Spacer to push ProductCounter to bottom
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: ProductCounter(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget productBill() {
  return Container(
    padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
    height: 350,
    decoration: const BoxDecoration(
        image: DecorationImage(
      image: AssetImage("./assets/images/shopBillCard.png"),
    )),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order Details',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: hexToColor(primaryColor),
              fontSize: 16),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 15),
          child: Row(
            children: [
              Text("Bag Total"),
              Spacer(
                flex: 1,
              ),
              Text("₹ 1,179.00")
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Row(
            children: [
              Text("Bag Savings"),
              Spacer(
                flex: 1,
              ),
              Text(
                "- ₹ 500.00",
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Row(
            children: [
              Text("Delivery Fee"),
              Spacer(
                flex: 1,
              ),
              Text("₹ 99.00")
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          'Order Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Row(
            children: [
              MyCheckbox(),
              SizedBox(
                width: 10,
              ),
              Text("Wallet Amount"),
              Spacer(
                flex: 1,
              ),
              Text("- ₹ 50.00")
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 15),
          child: Row(
            children: [
              Text(
                "Amount Payable",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Spacer(
                flex: 1,
              ),
              Text(
                "₹ 1,179",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ],
    ),
  );
}

class MyCheckbox extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool>? onChanged;

  const MyCheckbox({
    super.key,
    this.initialValue = false,
    this.onChanged,
  });

  @override
  State<StatefulWidget> createState() {
    return _MyCheckboxState();
  }
}

class _MyCheckboxState extends State<MyCheckbox> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
          widget.onChanged?.call(_isChecked);
        });
      },
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          border: Border.all(
            color: _isChecked ? Colors.blue : Colors.grey,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: _isChecked
            ? const Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.check,
                  size: 20,
                  color: Colors.blue,
                ))
            : null,
      ),
    );
  }
}

void navigateToDeliveryInfoScreen(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
    return const DeliveryInfoScreen();
  }));
}

class ProductCounter extends StatefulWidget {
  const ProductCounter({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProductCounterState();
  }
}

class _ProductCounterState extends State<ProductCounter> {
  int tokenCount = 1;

  void addToken() {
    setState(() {
      tokenCount++;
    });
  }

  void removeToken() {
    setState(() {
      if (tokenCount > 1) {
        tokenCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
      child: Row(
        children: [
          SizedBox(
            height: 25,
            width: 25,
            child: GestureDetector(
              onTap: () {
                removeToken();
              },
              child: const Card(
                shape: RoundedRectangleBorder(),
                color: Color(0xFF4F346B),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "-",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
            width: 20,
            child: Container(
              color: const Color.fromARGB(255, 237, 240, 254),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  tokenCount.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25,
            width: 25,
            child: GestureDetector(
              onTap: () {
                addToken();
              },
              child: const Card(
                shape: RoundedRectangleBorder(),
                color: Color(0xFF4F346B),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "+",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
