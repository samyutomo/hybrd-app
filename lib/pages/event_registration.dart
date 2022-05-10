import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class EventRegister extends StatelessWidget {
  const EventRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PopUpChoices(),
    );
  }
}

class PopUpChoices extends StatelessWidget {
  const PopUpChoices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
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
                        topLeft: Radius.circular(26.0),
                        topRight: Radius.circular(26.0))),
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
                                  color: Colors.grey,
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
                                    "Title",
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
                            alignment: Alignment.centerLeft,
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
                                        color:
                                            Color.fromRGBO(16, 141, 232, 1.0)),
                                  ))
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 50,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.place,
                                        color: Colors.red,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text("address")
                                    ],
                                  )),
                              const Expanded(flex: 1, child: Icon(Icons.abc))
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 50,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("11 Mei 2022",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold
                                    ),
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
                          margin: const EdgeInsets.symmetric(horizontal: 20),
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
                              Text("Education",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.orange
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 50,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.sell,
                                        color:
                                            Color.fromRGBO(16, 141, 232, 1.0),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text("Rp 100.000")
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
                                                content: Text("Ticket SOLD!"),
                                              ));
                                    },
                                    child: const Text(
                                      "Buy Ticket",
                                      style: TextStyle(color: Colors.white),
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
                        Container(
                            width: double.infinity,
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text("About Event")),

                      ],
                    ),
                  );
                });
          },
          child: const Text("Show Menu")),
    );
  }

  int randomUser() {
    Random random = Random();
    return random.nextInt(100);
  }
}
