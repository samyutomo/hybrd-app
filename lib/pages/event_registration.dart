import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hybrd_app/pages/brief_description.dart';

class EventRegister extends StatefulWidget {
  const EventRegister({Key? key}) : super(key: key);

  @override
  State<EventRegister> createState() => _EventRegisterState();
}

class _EventRegisterState extends State<EventRegister> {
  final TextEditingController _controllerDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl:
                      'https://i.pinimg.com/564x/c9/fd/cd/c9fdcd6c535b18372383830986fc6df7.jpg',
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                Positioned(
                    top: 20,
                    left: 20,
                    child: CircleAvatar(
                      backgroundColor: Colors.white70,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.black87,
                          )),
                    ))
              ],
            ),
            Container(
              height: 60,
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Buy Ticket",
                style: TextStyle(
                    fontFamily: 'Panton',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Sushi Hiro",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                          Text(
                            "Ruko Garden House Blok B No. 18D",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontFamily: 'Poppins'),
                          )
                        ],
                      )),
                  Expanded(
                      child: CachedNetworkImage(
                    imageUrl:
                        'https://i.pinimg.com/564x/cd/8b/9f/cd8b9f844b12078115e4eabd4f98e1a5.jpg',
                    height: 30,
                  ))
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  const Icon(
                    Icons.date_range,
                    color: Color.fromRGBO(16, 141, 232, 1.0),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _controllerDate,
                      decoration: InputDecoration(
                          hintText: "Date Choices",
                          labelText: "Sun - Mon",
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: Colors.orange)),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: Colors.white))),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  const Icon(
                    Icons.access_time,
                    color: Color.fromRGBO(16, 141, 232, 1.0),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _controllerDate,
                      decoration: InputDecoration(
                          hintText: "Hour",
                          labelText: "10:00 - 18:00",
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: Colors.orange)),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: Colors.white))),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: const [
                  Icon(
                    Icons.sell,
                    color: Color.fromRGBO(16, 141, 232, 1.0),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text("Rp 100.000"),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text("Please fill information"),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Column(
                        children: [Text("")],
                      )),
                  Expanded(
                      flex: 1,
                      child:
                      OutlinedButton(onPressed: () {}, child: Text("Edit")))
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text("Select Payment"),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          Icon(Icons.monetization_on),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Smooth")
                        ],
                      )),
                  Expanded(
                    flex: 1,
                    child:
                        OutlinedButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    content: Text("We're sorry you could only choose Smooth this time"),
                                  )
                              );
                            },
                            child: Text("Change")),
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 40),
                child: const PopUpChoices()
            )
          ],
        ),
      ),
    );
  }
}

class PopUpChoices extends StatelessWidget {
  const PopUpChoices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              elevation: 7.0,
              isScrollControlled: true,
              backgroundColor: Colors.white,
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width - 20,
                  maxHeight: MediaQuery.of(context).size.height - 100),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(24.0))),
              builder: (context) {
                return Container(
                  height: 700,
                  padding: const EdgeInsets.only(top: 3),
                  child: Column(
                    children: [
                      Stack(
                          alignment: AlignmentDirectional.topCenter,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              child: CachedNetworkImage(
                                imageUrl:
                                    'https://i.pinimg.com/564x/65/43/aa/6543aac02356113ccb729fafc28d763f.jpg',
                                width: MediaQuery.of(context).size.width - 25,
                                height: 300,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Positioned(
                              top: -20.0,
                              child: SizedBox(
                                  child: Icon(
                                Icons.minimize,
                                size: 50,
                                color: Colors.white,
                              )),
                            ),
                          ]),
                      Container(
                        height: 50,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            const Expanded(
                                flex: 4,
                                child: Text(
                                  "International Education Expo 2022",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )),
                            Expanded(
                                flex: 1,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.share))),
                            Expanded(
                                flex: 1,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.bookmark,
                                      size: 30,
                                    )))
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            const SizedBox(width: 20),
                            Positioned(
                              left: 0,
                              child: SizedBox(
                                width: 20,
                                height: 20,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://randomuser.me/api/portraits/men/${randomUser()}.jpg'),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              child: SizedBox(
                                width: 20,
                                height: 20,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://randomuser.me/api/portraits/men/${randomUser()}.jpg'),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 40,
                              child: SizedBox(
                                width: 20,
                                height: 20,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://randomuser.me/api/portraits/men/${randomUser()}.jpg'),
                                ),
                              ),
                            ),
                            Positioned(
                                left: 70,
                                child: Text(
                                  "+${randomUser()} going",
                                  style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(16, 141, 232, 1.0)),
                                ))
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 50,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 3,
                                        child: Row(
                                          children: const [
                                            Icon(
                                              Icons.place,
                                              color: Colors.red,
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Text(
                                                "Neo SOHO, Lt. LG 101 - LGM 101",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: Container(
                                            alignment: Alignment.centerRight,
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  'https://i.pinimg.com/564x/1b/87/7f/1b877fc422ad6bf3e8bf9768fa8d966e.jpg',
                                              height: 25,
                                              fit: BoxFit.cover,
                                            )))
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 50,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.date_range,
                                      color: Color.fromRGBO(16, 141, 232, 1.0),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "11 Mei 2022",
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text("10:00 - 12:00 WIB")
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 50,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "Education",
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.orange),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 30,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Row(
                                          children: const [
                                            Icon(
                                              Icons.sell,
                                              color: Color.fromRGBO(
                                                  16, 141, 232, 1.0),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              "Rp 100.000",
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    const AlertDialog(
                                                      content:
                                                          Text("Ticket SOLD!"),
                                                    ));
                                          },
                                          child: const Text(
                                            "Buy Ticket",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      const Color.fromRGBO(
                                                          16, 141, 232, 1.0)),
                                              shape: MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)))),
                                        ))
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                  width: double.infinity,
                                  height: 50,
                                  alignment: Alignment.centerLeft,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: const Text(
                                    "About Event",
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )),
                              const BriefDescription(
                                  description: "description"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              });
        },
        child: const Text("Pay"));
  }

  int randomUser() {
    Random random = Random();
    return random.nextInt(100);
  }
}
