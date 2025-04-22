// ignore_for_file: sort_child_properties_last, unnecessary_string_interpolations, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var billAmtController = TextEditingController();
  var customTipController = TextEditingController();

  int perCount = 1;
  int tipPercentage = 0;
  num totalBillAmt = 0.0;
  num totalTipAmt = 0.0;
  num totalAmt = 0.0;
  num perPersonAmt = 0.0;
  bool isCustomTip = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Padding(
          padding: const EdgeInsets.all(21.0),
          child: Column(
            children: [
              Expanded(flex: 3, child: getTitlePart1()),
              Expanded(flex: 6, child: getTitlePart2()),
              Expanded(flex: 3, child: getEnterBillPart3()),
              Expanded(flex: 4, child: getTipPart4()),
              Expanded(flex: 2, child: getSplitPart5()),
            ],
          ),
        ),
      ),
    );
  }

  ///...part 1
  Widget getTitlePart1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/logo.png"),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(TextSpan(
                text: "Mr",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                      text: "TIP",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w900))
                ])),
            Text("Calculator",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          ],
        ),
      ],
    );
  }

  ///...Part 2
  Widget getTitlePart2() {
    return Card(
      child: Container(
        margin: const EdgeInsets.all(21.0),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("Total p/person",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700)),
            Text.rich(TextSpan(
                text: "\₹",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                ),
                children: [
                  TextSpan(
                      text:
                          "${perPersonAmt == 0.0 ? "000" : perPersonAmt.toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontSize: 47, fontWeight: FontWeight.w900))
                ])),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Total bill",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    Text.rich(TextSpan(
                        text: "\₹",
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF03C9BD)),
                        children: [
                          TextSpan(
                              text:
                                  "${totalBillAmt == 0.0 ? "000" : totalBillAmt.toStringAsFixed(2)}",
                              style: const TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xFF03C9BD)))
                        ]))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Total tip",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    Text.rich(TextSpan(
                        text: "\₹",
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF03C9BD)),
                        children: [
                          TextSpan(
                              text:
                                  "${totalTipAmt == 0.0 ? "000" : totalTipAmt.toStringAsFixed(2)}",
                              style: const TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xFF03C9BD)))
                        ]))
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      elevation: 7,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    );
  }

  ///...Part 3
  Widget getEnterBillPart3() {
    return Row(
      children: [
        const Expanded(
            flex: 1,
            child: Text.rich(
              TextSpan(
                text: "Enter\n",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900),
                children: [
                  TextSpan(
                    text: "your bill",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            )),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: billAmtController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 240, 250, 250),
                  filled: true,
                  prefixText: "\₹",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          style: BorderStyle.none,
                          color: Colors.white,
                          width: 1))),
            ),
          ),
        )
      ],
    );
  }

  ///...Part 4
  Widget getTipPart4() {
    return Row(
      children: [
        const Expanded(
            flex: 1,
            child: Text.rich(
              TextSpan(
                text: "Choose\n",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900),
                children: [
                  TextSpan(
                    text: "your tip",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            )),
        Expanded(
            flex: 3,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 12.0, bottom: 12.0, left: 8.0, right: 8.0),
                          child: InkWell(
                            onTap: () {
                              tipPercentage = 10;
                              updateTheResult();
                            },
                            child: Container(
                                height: double.infinity,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: const Color(0xFF03C9BD),
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Center(
                                  child: Text.rich(
                                    TextSpan(
                                        text: "10",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w900),
                                        children: [
                                          TextSpan(
                                              text: "%",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400))
                                        ]),
                                  ),
                                )),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 12.0, bottom: 12.0, left: 8.0, right: 8.0),
                          child: InkWell(
                            onTap: () {
                              tipPercentage = 15;
                              updateTheResult();
                            },
                            child: Container(
                                height: double.infinity,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: const Color(0xFF03C9BD),
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Center(
                                  child: Text.rich(
                                    TextSpan(
                                        text: "15",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w900),
                                        children: [
                                          TextSpan(
                                              text: "%",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400))
                                        ]),
                                  ),
                                )),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 12.0, bottom: 12.0, left: 8.0, right: 8.0),
                          child: InkWell(
                            onTap: () {
                              tipPercentage = 20;
                              updateTheResult();
                            },
                            child: Container(
                                height: double.infinity,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: const Color(0xFF03C9BD),
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Center(
                                  child: Text.rich(
                                    TextSpan(
                                        text: "20",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w900),
                                        children: [
                                          TextSpan(
                                              text: "%",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400))
                                        ]),
                                  ),
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 8.0),
                    child: Stack(children: [
                      TextField(
                        controller: customTipController,
                        onChanged: (value) => {
                          if (value != "")
                            {
                              tipPercentage = int.parse(value),
                              updateTheResult()
                            }
                          else
                            {tipPercentage = 0, updateTheResult()}
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            fillColor: const Color.fromARGB(255, 240, 250, 250),
                            filled: true,
                            prefixText: "%",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    style: BorderStyle.none,
                                    color: Colors.white,
                                    width: 1))),
                      ),
                      isCustomTip
                          ? Container()
                          : InkWell(
                              onTap: () {
                                isCustomTip = true;
                                setState(() {});
                              },
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                    color: const Color(0xFF03C9BD),
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Center(
                                  child: Text(
                                    "Custom tip",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ),
                            ),
                    ]),
                  ),
                )
              ],
            ))
      ],
    );
  }

  ///...Part 5
  Widget getSplitPart5() {
    return Row(
      children: [
        const Expanded(
            flex: 1,
            child: Text.rich(
              TextSpan(
                text: "Split\n",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900),
                children: [
                  TextSpan(
                    text: "the total",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            )),
        Expanded(
          flex: 3,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: InkWell(
                    onTap: () {
                      if (perCount > 1) {
                        perCount--;
                        updateTheResult();
                      }
                    },
                    child: Container(
                        decoration: const BoxDecoration(
                            color: Color(0xFF03C9BD),
                            borderRadius: BorderRadiusDirectional.only(
                                topStart: Radius.circular(8),
                                bottomStart: Radius.circular(8))),
                        child: const Center(
                          child: Text(
                            "-",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w900),
                          ),
                        )),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                      color: const Color.fromARGB(255, 245, 250, 250),
                      child: Center(
                        child: Text(
                          '$perCount',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w900),
                        ),
                      )),
                ),
                Expanded(
                  flex: 3,
                  child: InkWell(
                    onTap: () {
                      perCount++;
                      updateTheResult();
                    },
                    child: Container(
                        decoration: const BoxDecoration(
                            color: Color(0xFF03C9BD),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5),
                                bottomRight: Radius.circular(5))),
                        child: const Center(
                          child: Text(
                            "+",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w900),
                          ),
                        )),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  /// Calculation Tip Result
  void updateTheResult() {
    if (billAmtController.text != "") {
      //tipPercentage = customTipController.text;
      totalBillAmt = double.parse(billAmtController.text.toString());
      totalTipAmt = totalBillAmt * (tipPercentage / 100);
      totalAmt = totalBillAmt + totalTipAmt;
      perPersonAmt = totalAmt / perCount;

      setState(() {
        // Update the UI with the calculated values
      });
    } else {
      perCount = 1;
    }
  }
}
