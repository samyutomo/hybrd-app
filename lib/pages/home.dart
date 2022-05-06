import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hybrd_app/models/hybrid_events.dart';
import 'package:logger/logger.dart';

class HomePage extends StatelessWidget {
  final UserCredential credential;

  const HomePage({Key? key, required this.credential}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var logger = Logger(
        printer: PrettyPrinter(
            lineLength: 100,
            methodCount: 2,
            errorMethodCount: 8,
            colors: true,
            printEmojis: true));

    String? loginName;

    User? user = credential.user;
    user?.reload();
    if (user?.displayName != null) {
      loginName = user?.displayName;
      logger.i("user log in: $user");
    } else {
      User? signupUser = FirebaseAuth.instance.currentUser;
      signupUser?.reload();
      loginName = signupUser?.displayName;
      logger.i("user just sign up: ${signupUser?.displayName}");
    }
    loginName ??= "error name";

    double imageEventWidth = (1 / 2) * MediaQuery.of(context).size.width;

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
                  margin: const EdgeInsets.only(top: 120),
                  child: Stack(children: [
                    Container(
                      width: double.infinity,
                      height: 50,
                      alignment: Alignment.bottomCenter,
                      child: const Text(
                        "Jakarta, Indonesia",
                        style: TextStyle(
                          fontFamily: 'Panton',
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      child: ElevatedButton(
                          onPressed: () async {
                            await FirebaseAuth.instance.signOut();
                            Navigator.pop(context);
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20)))),
                          child: const Text("Logout")),
                    ),
                  ]),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 20, right: 20, left: 20),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(60),
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20)),
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://i.pinimg.com/564x/be/92/e9/be92e978d325698600a3e4eacf1d94e5.jpg',
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          width: MediaQuery.of(context).size.width - 40,
                          height: 70,
                          top: 0,
                          left: 0,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(top: 15, left: 20),
                            decoration: const BoxDecoration(
                              color: Colors.white54,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(60)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "06 - 09 Mei 2022",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.red),
                                ),
                                Text(
                                  "BIASA Art Space",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
                const SizedBox(height: 30),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text(
                    "On Site Events",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 22,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      HybridEvent event = onsiteEventList[index];
                      return InkWell(
                        onTap: () {},
                        child: Card(
                          margin: const EdgeInsets.only(right: 20, bottom: 10),
                          color: const Color.fromRGBO(245, 229, 220, 1),
                          shadowColor: Colors.black45,
                          elevation: 8.0,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(26))),
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20)),
                                      child: Hero(
                                        tag: event.tag,
                                        child: CachedNetworkImage(
                                          imageUrl:
                                          event.imageAsset,
                                          width: imageEventWidth,
                                          height: 110,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: imageEventWidth,
                                      margin: const EdgeInsets.only(top: 120),
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Text(
                                              event.name,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 30,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10),
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
                                                    left: 65,
                                                    child: Text(
                                                      "+${randomUser()} going",
                                                      style: const TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12,
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          color: Colors.indigo),
                                                    ))
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              const Expanded(
                                                  flex: 1,
                                                  child: Icon(
                                                    Icons.location_on,
                                                    color: Colors.red,
                                                    size: 20,
                                                  )),
                                              Expanded(
                                                flex: 6,
                                                child: Text(
                                                  event.hybrid,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.fade,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                        width: 200,
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              decoration: const BoxDecoration(
                                                  color: Colors.white70,
                                                  borderRadius:
                                                  BorderRadius.only(
                                                      topLeft:
                                                      Radius.circular(
                                                          20),
                                                      bottomRight:
                                                      Radius.circular(
                                                          10))),
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.all(10.0),
                                                child: Column(
                                                  children: [
                                                    Text(event.hour,
                                                        style: const TextStyle(
                                                            fontFamily:
                                                            'Poppins',
                                                            fontSize: 12,
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            color: Colors.red)),
                                                    Text(event.date,
                                                        style: const TextStyle(
                                                            fontFamily:
                                                            'Poppins',
                                                            fontSize: 12,
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            color: Colors.red))
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 20, right: 4),
                                              height: 35,
                                              width: 35,
                                              decoration: const BoxDecoration(
                                                  color: Colors.white70,
                                                  borderRadius:
                                                  BorderRadius.only(
                                                      topRight:
                                                      Radius.circular(
                                                          20),
                                                      bottomLeft:
                                                      Radius.circular(
                                                          10))),
                                              child: IconButton(
                                                  onPressed: () {
                                                    ScaffoldMessenger.of(
                                                        context)
                                                        .showSnackBar(
                                                        const SnackBar(
                                                            content: Text(
                                                                "Event Saved")));
                                                  },
                                                  icon: const Icon(
                                                    Icons.bookmark,
                                                    color: Colors.red,
                                                    size: 17,
                                                  )),
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: onsiteEventList.length,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text(
                    "Online Events",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 22,
                    ),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      HybridEvent event = onlineEventList[index];
                      return InkWell(
                        onTap: () {},
                        child: Card(
                          margin: const EdgeInsets.only(right: 20, bottom: 10),
                          color: const Color.fromRGBO(245, 229, 220, 1),
                          shadowColor: Colors.black45,
                          elevation: 8.0,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(26))),
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20)),
                                      child: Hero(
                                        tag: event.tag,
                                        child: CachedNetworkImage( 
                                          imageUrl:
                                              event.imageAsset,
                                          width: imageEventWidth,
                                          height: 110,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: imageEventWidth,
                                      margin: const EdgeInsets.only(top: 120),
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Text(
                                              event.name,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 30,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10),
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
                                                    left: 65,
                                                    child: Text(
                                                      "+${randomUser()} going",
                                                      style: const TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.indigo),
                                                    ))
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              const Expanded(
                                                  flex: 1,
                                                  child: Icon(
                                                    Icons.location_on,
                                                    color: Colors.red,
                                                    size: 20,
                                                  )),
                                              Expanded(
                                                flex: 6,
                                                child: Text(
                                                  event.hybrid,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.fade,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                        width: 200,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              decoration: const BoxDecoration(
                                                  color: Colors.white70,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10))),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Column(
                                                  children: [
                                                    Text(event.hour,
                                                        style: const TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.red)),
                                                    Text(event.date,
                                                        style: const TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.red))
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 20, right: 4),
                                              height: 35,
                                              width: 35,
                                              decoration: const BoxDecoration(
                                                  color: Colors.white70,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  20),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10))),
                                              child: IconButton(
                                                  onPressed: () {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                            const SnackBar(
                                                                content: Text(
                                                                    "Event Saved")));
                                                  },
                                                  icon: const Icon(
                                                    Icons.bookmark,
                                                    color: Colors.red,
                                                    size: 17,
                                                  )),
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: onlineEventList.length,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('images/background.png'),
                      fit: BoxFit.cover),
                  color: const Color.fromRGBO(245, 229, 220, 1),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26.withOpacity(0.1),
                        spreadRadius: 4,
                        blurRadius: 5,
                        offset: const Offset(0, 2))
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                height: 100,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      width: 70,
                      height: 70,
                      child: const CircleAvatar(
                        child: Icon(
                          Icons.account_circle,
                          size: 60,
                          color: Color.fromRGBO(255, 255, 255, 0.9),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Hello ${capitalize(loginName)},",
                          style: const TextStyle(
                              fontFamily: 'Poppins', fontSize: 25),
                        ),
                        const Text(
                          "Welcome to Hybrid",
                          style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                        )
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 10),
                      width: 70,
                      height: 70,
                      child: IconButton(
                          alignment: Alignment.center,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                      content: Text("Empty Notification"));
                                });
                          },
                          color: const Color.fromRGBO(254, 167, 37, 0.3),
                          icon: const Icon(
                            Icons.circle_notifications,
                            size: 60,
                          )),
                    )
                  ],
                )),
          ),
        ],
      )),
    );
  }

  randomUser() {
    Random random = Random();
    return random.nextInt(100);
  }

  String? capitalize(String loginName) {
    return loginName[0].toUpperCase() + loginName.substring(1).toLowerCase();
  }
}
