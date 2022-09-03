import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'images/background.png',
              width: MediaQuery.of(context).size.width,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 70),
                    child: const Text(
                      "Ticket",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 28,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40.0),
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    child: SizedBox(
                      height: 500,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 5.0, left: 20.0, right: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Power Point Bisa",
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text("Ticket ID #12345"),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                CachedNetworkImage(
                                  imageUrl:
                                      "https://i.pinimg.com/564x/cd/8b/9f/cd8b9f844b12078115e4eabd4f98e1a5.jpg",
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.fitHeight,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 10.0),
                                  height: 50.0,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Link :",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "http://www.zoom.us",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Attendee Information",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                  ),
                                  Text(
                                    "Aminatus",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "Date",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 14),
                                      ),
                                      Text(
                                        "Mon 20 Dec",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, left: 20.0),
                                  child: SizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "Time",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 14),
                                        ),
                                        Text(
                                          "10:00 WIB",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Divider(
                              thickness: 1.0,
                              color: Colors.grey,
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Text(
                                    "Show the QR at the counter",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  CachedNetworkImage(
                                    imageUrl:
                                        "https://i.pinimg.com/originals/21/6a/cc/216acc556a3f88e085ddbc07fa17b2a2.jpg",
                                    width: 200,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 10,
              child: Container(
                alignment: Alignment.centerLeft,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 35,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
