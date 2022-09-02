import 'dart:math';
import 'package:hybrd_app/models/hybrid_events.dart';
import 'package:hybrd_app/notification/snackbar_dialog.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'event_payment.dart';

class EventRegister extends StatefulWidget {
  final HybridEvent chosenEvent;

  const EventRegister({Key? key, required this.chosenEvent}) : super(key: key);

  @override
  State<EventRegister> createState() => _EventRegisterState();
}

class _EventRegisterState extends State<EventRegister> {
  final TextEditingController _controllerDate = TextEditingController();
  final TextEditingController _controllerHour = TextEditingController();
  final TextEditingController _controllerAttendeeCount = TextEditingController();
  final TextEditingController _controllerAttendeeName = TextEditingController();
  final TextEditingController _controllerAttendeeMail = TextEditingController();
  final _attendeeFormKey = GlobalKey<FormState>();

  int _counter = 1;
  String _attendeeName = "Buyer name";
  String _attendeeMail = "Email";


  @override
  void dispose() {
    _controllerDate.dispose();
    _controllerHour.dispose();
    _controllerAttendeeCount.dispose();
    _controllerAttendeeName.dispose();
    _controllerAttendeeMail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controllerAttendeeCount.text = _counter.toString();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl:
                  widget.chosenEvent.imageAsset,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
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
                          Text(widget.chosenEvent.name,
                              style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                          Text(
                            widget.chosenEvent.hybrid,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontFamily: 'Poppins'),
                          )
                        ],
                      )),
                  Expanded(
                      child: CachedNetworkImage(
                        imageUrl:
                        widget.chosenEvent.hybridType,
                        height: 30,
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 30),
                child: Column(children: [
                  Container(
                    height: 40,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
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
                            readOnly: true,
                            controller: _controllerDate,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                          context: context,
                                          elevation: 7.0,
                                          isScrollControlled: true,
                                          backgroundColor: Colors.white,
                                          constraints: BoxConstraints(
                                              maxWidth: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width -
                                                  20,
                                              maxHeight: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .height -
                                                  100),
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topLeft:
                                                  Radius.circular(24.0),
                                                  topRight:
                                                  Radius.circular(24.0))),
                                          builder: (context) {
                                            return Container(
                                              width: double.infinity,
                                              height: 300,
                                              padding:
                                              const EdgeInsets.only(top: 5),
                                              child: Column(
                                                children: [
                                                  Stack(
                                                      alignment:
                                                      Alignment.center,
                                                      children: [
                                                        Container(
                                                          margin:
                                                          const EdgeInsets
                                                              .only(
                                                              top: 40,
                                                              left: 20,
                                                              right: 20),
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: const [
                                                              Text(
                                                                "Select Date",
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                    'Poppins',
                                                                    fontSize:
                                                                    16,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                              ),
                                                              Text(
                                                                "Choose one of the dates",
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                    'Poppins'),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        const Positioned(
                                                          top: -30,
                                                          child: Icon(
                                                            Icons.minimize,
                                                            size: 50,
                                                            color: Colors.grey,
                                                          ),
                                                        )
                                                      ]),
                                                  Container(
                                                    height: 100,
                                                    margin: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 20),
                                                    child: ListView.builder(
                                                      scrollDirection: Axis
                                                          .vertical,
                                                      itemBuilder: (
                                                          BuildContext context,
                                                          int index) {
                                                        return OutlinedButton(
                                                          onPressed: () {
                                                            _controllerDate
                                                                .text =
                                                            listEventDate(widget.chosenEvent)[index];
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          style: ButtonStyle(
                                                            shape: MaterialStateProperty
                                                                .all(
                                                              const RoundedRectangleBorder(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                                  Radius
                                                                      .circular(
                                                                      20.0),),),),),
                                                          child: Text(
                                                            listEventDate(widget.chosenEvent)[index],
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .grey),
                                                          ),
                                                        );
                                                      },
                                                      itemCount: widget
                                                          .chosenEvent.isOnline
                                                          ? 1
                                                          : 2,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          });
                                    },
                                    icon: const Icon(Icons.arrow_drop_down)),
                                labelText: "Date",
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                    borderSide:
                                    BorderSide(color: Colors.orange)),
                                enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                    borderSide:
                                    BorderSide(color: Colors.white))),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
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
                            readOnly: true,
                            controller: _controllerHour,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                          context: context,
                                          elevation: 7.0,
                                          isScrollControlled: true,
                                          backgroundColor: Colors.white,
                                          constraints: BoxConstraints(
                                              maxWidth: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width -
                                                  20,
                                              maxHeight: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .height -
                                                  100),
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topLeft:
                                                  Radius.circular(24.0),
                                                  topRight:
                                                  Radius.circular(24.0))),
                                          builder: (context) {
                                            return Container(
                                              width: double.infinity,
                                              height: 300,
                                              padding:
                                              const EdgeInsets.only(top: 5),
                                              child: Column(
                                                children: [
                                                  Stack(
                                                      alignment:
                                                      Alignment.center,
                                                      children: [
                                                        Container(
                                                          margin:
                                                          const EdgeInsets
                                                              .only(
                                                              top: 40,
                                                              left: 20,
                                                              right: 20),
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: const [
                                                              Text(
                                                                "Select Time",
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                    'Poppins',
                                                                    fontSize:
                                                                    16,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                              ),
                                                              Text(
                                                                "Choose one of the times",
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                    'Poppins'),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        const Positioned(
                                                          top: -30,
                                                          child: Icon(
                                                            Icons.minimize,
                                                            size: 50,
                                                            color: Colors.grey,
                                                          ),
                                                        )
                                                      ]),
                                                  const SizedBox(height: 20),
                                                  Container(
                                                    height: 100,
                                                    margin: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 20),
                                                    child: ListView.builder(
                                                      scrollDirection: Axis
                                                          .vertical,
                                                      itemBuilder: (
                                                          BuildContext context,
                                                          int index) {
                                                        return OutlinedButton(
                                                          onPressed: () {
                                                            _controllerHour
                                                                .text =
                                                            widget.chosenEvent
                                                                .listHour[index];
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          style: ButtonStyle(
                                                              shape: MaterialStateProperty
                                                                  .all(
                                                                  const RoundedRectangleBorder(
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .all(
                                                                          Radius
                                                                              .circular(
                                                                              20.0))))),
                                                          child: Text(
                                                            widget.chosenEvent
                                                                .listHour[index],
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .grey),
                                                          ),
                                                        );
                                                      },
                                                      itemCount: widget
                                                          .chosenEvent.listHour
                                                          .length,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          });
                                    },
                                    icon: const Icon(Icons.arrow_drop_down)),
                                labelText: "Hour",
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                    borderSide:
                                    BorderSide(color: Colors.orange)),
                                enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                    borderSide:
                                    BorderSide(color: Colors.white))),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.person_outline,
                          color: Color.fromRGBO(16, 141, 232, 1.0),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.orange,
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (_counter > 1) {
                                            _counter--;
                                            _controllerAttendeeCount.text =
                                                _counter.toString();
                                          }
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 20,
                                      )),
                                ),
                                Container(
                                  width: 50,
                                  height: 50,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: TextFormField(
                                    controller: _controllerAttendeeCount,
                                    readOnly: true,
                                    textAlign: TextAlign.center,
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: const InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                          borderSide:
                                          BorderSide(color: Colors.white)),
                                    ),
                                  ),
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.orange,
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (_counter < 5) {
                                            _counter++;
                                            _controllerAttendeeCount.text =
                                                _counter.toString();
                                          }
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 20,
                                      )),
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.sell,
                          color: Color.fromRGBO(16, 141, 232, 1.0),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Text(
                            priceToString(_counter * widget.chosenEvent.price),
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text(
                      "Please fill information", style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold
                    ),),
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
                                Text(_attendeeName),
                                Text(_attendeeMail)
                              ],
                            )),
                        Expanded(
                            flex: 1,
                            child: OutlinedButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      elevation: 7.0,
                                      isScrollControlled: true,
                                      backgroundColor: Colors.white,
                                      constraints: BoxConstraints(
                                          maxWidth: MediaQuery
                                              .of(context)
                                              .size
                                              .width -
                                              20,
                                          maxHeight: MediaQuery
                                              .of(context)
                                              .size
                                              .height -
                                              100),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft:
                                              Radius.circular(24.0),
                                              topRight:
                                              Radius.circular(24.0))),
                                      builder: (context) {
                                        return Container(
                                            width: double.infinity,
                                            height: 550,
                                            padding:
                                            const EdgeInsets.only(top: 5),
                                            child: Form(
                                              child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .stretch, children: [
                                                Stack(
                                                    alignment:
                                                    Alignment.center,
                                                    children: [
                                                      Container(
                                                        margin:
                                                        const EdgeInsets
                                                            .only(
                                                            top: 40,
                                                            left: 20,
                                                            right: 20),
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          children: const [
                                                            Text(
                                                              "Attendee Information",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                  'Poppins',
                                                                  fontSize:
                                                                  16,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                            ),
                                                            Text(
                                                              "Attendee 1",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                  'Poppins'),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      const Positioned(
                                                        top: -30,
                                                        child: Icon(
                                                          Icons.minimize,
                                                          size: 50,
                                                          color: Colors.grey,
                                                        ),
                                                      )
                                                    ]),
                                                const SizedBox(height: 20),
                                                Expanded(
                                                  child: SingleChildScrollView(
                                                    child: Form(
                                                      key: _attendeeFormKey,
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 20.0,
                                                                vertical: 10.0),
                                                            child: TextFormField(
                                                                validator: (
                                                                    value) {
                                                                  bool validUsername = RegExp(
                                                                      r"^[a-zA-Z0-9]+$")
                                                                      .hasMatch(
                                                                      value!);
                                                                  if (value
                                                                      .isEmpty) {
                                                                    return "Input can't be empty!";
                                                                  } else
                                                                  if (!validUsername) {
                                                                    return "Input only text or combination text and number!";
                                                                  } else {
                                                                    return null;
                                                                  }
                                                                },
                                                                controller: _controllerAttendeeName,
                                                                decoration: const InputDecoration(
                                                                  hintText: "Attendee Name",
                                                                  labelText: "Name",
                                                                  filled: true,
                                                                  fillColor: Colors
                                                                      .white,
                                                                  focusedBorder: OutlineInputBorder(
                                                                      borderRadius: BorderRadius
                                                                          .all(
                                                                          Radius
                                                                              .circular(
                                                                              20)),
                                                                      borderSide: BorderSide(
                                                                          color: Colors
                                                                              .orange)),
                                                                  enabledBorder: OutlineInputBorder(
                                                                      borderRadius: BorderRadius
                                                                          .all(
                                                                          Radius
                                                                              .circular(
                                                                              20)),
                                                                      borderSide: BorderSide(
                                                                          color: Colors
                                                                              .grey)),
                                                                )),
                                                          ),
                                                          Padding(
                                                              padding: const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal: 20.0,
                                                                  vertical: 10.0),
                                                              child: TextFormField(
                                                                  validator: (
                                                                      value) {
                                                                    bool validEmail = RegExp(
                                                                        r"^[a-zA-Z0-9_.-]+@[a-zA-Z0-9]+\.[a-zA-Z]+[a-zA-Z]+[a-zA-Z.]*$")
                                                                        .hasMatch(
                                                                        value!);
                                                                    if (value
                                                                        .isEmpty) {
                                                                      return "Input can't be empty!";
                                                                    } else
                                                                    if (!validEmail) {
                                                                      return "Please input valid email format. Ex: ironman@tonystark.com";
                                                                    } else {
                                                                      return null;
                                                                    }
                                                                  },
                                                                  controller: _controllerAttendeeMail,
                                                                  decoration: const InputDecoration(
                                                                      hintText: "Attendee Email",
                                                                      labelText: "Email",
                                                                      filled: true,
                                                                      fillColor: Colors
                                                                          .white,
                                                                      focusedBorder: OutlineInputBorder(
                                                                          borderRadius: BorderRadius
                                                                              .all(
                                                                              Radius
                                                                                  .circular(
                                                                                  20)),
                                                                          borderSide: BorderSide(
                                                                              color: Colors
                                                                                  .orange)),
                                                                      enabledBorder: OutlineInputBorder(
                                                                          borderRadius: BorderRadius
                                                                              .all(
                                                                              Radius
                                                                                  .circular(
                                                                                  20)),
                                                                          borderSide: BorderSide(
                                                                              color: Colors
                                                                                  .grey))))),
                                                          const SizedBox(
                                                              height: 20),
                                                          Padding(
                                                            padding: const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 20.0),
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                  child: OutlinedButton(
                                                                      onPressed: () {
                                                                        Navigator
                                                                            .pop(
                                                                            context);
                                                                      },
                                                                      style: ButtonStyle(
                                                                          side: MaterialStateProperty
                                                                              .all(
                                                                              const BorderSide(
                                                                                  width: 1.5,
                                                                                  color: Colors
                                                                                      .orange)
                                                                          ),
                                                                          shape: MaterialStateProperty
                                                                              .all(
                                                                              RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius
                                                                                      .circular(
                                                                                      20)))),
                                                                      child: const Padding(
                                                                        padding: EdgeInsets
                                                                            .symmetric(
                                                                            vertical: 10),
                                                                        child: Text(
                                                                          "Cancel",
                                                                          style: TextStyle(
                                                                              color: Colors
                                                                                  .orange,
                                                                              fontWeight: FontWeight
                                                                                  .bold,
                                                                              fontSize: 16),
                                                                        ),
                                                                      )),
                                                                ),
                                                                const SizedBox(
                                                                    width: 20.0),
                                                                Expanded(
                                                                  child: ElevatedButton(
                                                                      onPressed: () {
                                                                        setState(() {
                                                                          if (_attendeeFormKey
                                                                              .currentState!
                                                                              .validate()) {
                                                                            _attendeeName =
                                                                                _controllerAttendeeName
                                                                                    .text;
                                                                            _attendeeMail =
                                                                                _controllerAttendeeMail
                                                                                    .text;
                                                                            Navigator
                                                                                .pop(
                                                                                context);
                                                                          }
                                                                        });
                                                                      },
                                                                      style: ButtonStyle(
                                                                          shape: MaterialStateProperty
                                                                              .all(
                                                                              RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius
                                                                                      .circular(
                                                                                      20)))),
                                                                      child: const Padding(
                                                                        padding: EdgeInsets
                                                                            .symmetric(
                                                                            vertical: 10),
                                                                        child: Text(
                                                                          "Save",
                                                                          style: TextStyle(
                                                                              color: Colors
                                                                                  .white,
                                                                              fontWeight: FontWeight
                                                                                  .bold,
                                                                              fontSize: 16),
                                                                        ),
                                                                      )),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),

                                              ]),
                                            )
                                        );
                                      });
                                },
                                style: ButtonStyle(
                                    side: MaterialStateProperty.all(
                                        const BorderSide(
                                            color: Color.fromRGBO(
                                                16, 141, 232, 1.0),
                                            width: 1.5,
                                            style: BorderStyle.solid
                                        )
                                    ),
                                    shape: MaterialStateProperty.all(
                                        const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))
                                        )
                                    )
                                ),
                                child: const Text("Edit", style: TextStyle(
                                    color: Color.fromRGBO(16, 141, 232, 1.0)
                                ),)
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text("Select Payment", style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Row(
                              children: const [
                                Icon(Icons.monetization_on,
                                    color: Color.fromRGBO(16, 141, 232, 1.0)),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Smooth")
                              ],
                            )),
                        Expanded(
                          flex: 1,
                          child: OutlinedButton(
                              onPressed: () {
                                notifSnackBar(context,
                                    "We're sorry you could only choose Smooth this time");
                              },
                              style: ButtonStyle(
                                  side: MaterialStateProperty.all(
                                      const BorderSide(
                                          color: Color.fromRGBO(
                                              16, 141, 232, 1.0),
                                          width: 1.5,
                                          style: BorderStyle.solid
                                      )
                                  ),
                                  shape: MaterialStateProperty.all(
                                      const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))
                                      )
                                  )
                              ),
                              child: const Text("Change", style: TextStyle(
                                  color: Color.fromRGBO(16, 141, 232, 1.0)
                              ),)),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: const PopUpChoices())
                ]),
              ),
            ),
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
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => EventPayment())
          );
        },
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))
                )
            )
        ),
        child: const Text("Pay", style: TextStyle(
            fontSize: 18,
            color: Colors.white
        ),));
  }
}


String priceToString(int price) {
  var formatter = NumberFormat('#,###.0#');
  String formattedPrice;
  if (price < 1) {
    formattedPrice = "0";
  } else {
    formattedPrice = formatter.format(price);
  }
  return "Rp $formattedPrice";
}

int randomUser() {
  Random random = Random();
  return random.nextInt(100);
}

List<String> listEventDate(HybridEvent event) {
  List<String> listDate = [];
  if (event.isOnline) {
    listDate.add(event.date);
  } else {
    DateTime updateDay = DateTime.now();
    final now = DateTime.now();
    for (int i = 1; i <= 2; i++) {
      final dateFormat = DateFormat('d MMM yyyy');
      if (updateDay == now) {
        updateDay = now.add(const Duration(hours: 24));
      } else {
        updateDay = updateDay.add(const Duration(hours: 24));
      }

      String addDate = dateFormat.format(updateDay);
      listDate.add(addDate);
    }
  }
  return listDate;
}
