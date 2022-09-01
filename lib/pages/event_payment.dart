import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventPayment extends StatelessWidget {
  const EventPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_outlined)),
        title: const Center(child: Text("Payment Status")),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
          ),
          Container(
            color: Colors.blueAccent,
            width: MediaQuery.of(context).size.width,
            height: 250,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Icon(
                    Icons.monetization_on,
                    size: 100,
                    color: Colors.orange,
                  ),
                ),
                Text(
                  "Payment Success!",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  "Transaction paid successfully",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Positioned(
            top: 220,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1.0,
                          blurRadius: 8.0)
                    ]),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Rp 15.000",
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Hide detail",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1.0,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Order Info",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            Text(
                              "Order User",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 20.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Amount",
                              style:
                              TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            Text(
                              "Rp 15.000",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 20.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Transaction Time",
                              style:
                              TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            Text(
                              "10 Dec 2021 12:11:10",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      "CLOSE",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
