import 'package:book_cart/common/color_palette.dart';
import 'package:book_cart/components/text_field.dart';
import 'package:book_cart/providers/cart_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  void initState() {
    Provider.of<CartProvider>(context, listen: false).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Book Cart'),
        backgroundColor: Palette.primary,
      ),
      body: Consumer<CartProvider>(builder: (context, prov, _) {
        return Card(
          color: Palette.bg,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  color: Palette.secondary,
                  child: Center(
                      child: Text(
                    'Select books',
                    style: TextStyle(
                        color: Palette.fontColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              SizedBox(height: 10),
              Card(
                elevation: 3,
                color: Colors.white,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                ),
                child: DropdownButton<String>(
                  hint: Center(child: Text('Select book')),
                  // value: prov.initVal,
                  isExpanded: true,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  underline: Container(
                    height: 2,
                    color: Palette.primary,
                  ),
                  onChanged: (String? newValue) {
                    prov.setDropdownValue(newValue!);
                    prov.calculateTotalPriceAndDiscount();
                  },
                  items: prov
                      .getBooks()
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 25),
              Expanded(
                  flex: 10,
                  child: ListView.builder(
                    itemCount: prov.getSelectedBooks().length,
                    itemBuilder: (context, int index) {
                      return Card(
                        color: Palette.tertiary,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 150,
                              child: CustomText(
                                  displayText:
                                      prov.getSelectedBooks().elementAt(index)),
                            ),
                            SizedBox(
                              width: 120,
                              height: 50,
                              child: TextFormField(
                                initialValue: 1.toString(),
                                decoration: InputDecoration(
                                  hintText: 'Count',
                                  icon: Icon(Icons.add, color: Palette.primary),
                                  fillColor: Colors.transparent,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Palette.primary),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Palette.secondary),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                cursorColor: Palette.primary,
                                style: TextStyle(color: Palette.primary),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                onChanged: (count) {
                                  prov.setNoOfCopies(int.parse(count),
                                      prov.getSelectedBooks().elementAt(index));
                                  prov.calculateTotalPriceAndDiscount();
                                },
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  )),
              Container(
                height: 70,
                child: Card(
                    color: Palette.secondary,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomText(displayText: 'Total discount'),
                              CustomText(
                                  displayText:
                                      prov.totalDiscount.toString() + '%')
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomText(displayText: 'Final discounted price'),
                              CustomText(
                                  displayText:
                                      prov.discountedPrice.toString() + '\$')
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
              SizedBox(height: 10)
            ],
          ),
        );
      }),
    );
  }
}
