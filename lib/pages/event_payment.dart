import 'package:flutter/material.dart';
import 'package:hybrd_app/database/event_database.dart';
import 'package:hybrd_app/models/schedule_event.dart';
import 'package:hybrd_app/navigation/bottom_navigation.dart';
import 'package:hybrd_app/notification/snackbar_dialog.dart';
import 'package:intl/intl.dart';

class EventPayment extends StatefulWidget {
  final ScheduledEvent chosenEvent;

  const EventPayment({Key? key, required this.chosenEvent}) : super(key: key);

  @override
  State<EventPayment> createState() => _EventPaymentState();
}

class _EventPaymentState extends State<EventPayment> {
  bool isSaving = false;

  @override
  void initState() {
    super.initState();
    saveEvent(widget.chosenEvent);
  }

  Future saveEvent(ScheduledEvent event) async{
    setState(() => isSaving = true);
    await EventDatabase.instance.insertEvent(event);
    setState(() => isSaving = false);
  }

  @override
  Widget build(BuildContext context) {
    final paymentTime = widget.chosenEvent.time;
    final dateFormat = DateFormat('d MMM yyyy HH:mm:ss');
    final todayDate = dateFormat.format(paymentTime);

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
      body: isSaving ? const Center(child: CircularProgressIndicator()) : widget.chosenEvent.chosenDate.isNotEmpty ? Stack(
        children: [
          const SizedBox(
            height: double.infinity,
          ),
          Container(
            color: Colors.blueAccent,
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: 250,
            child: Column(
              children: const [
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
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 40,
                height: 300,
                decoration: const BoxDecoration(
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
                            widget.chosenEvent.price,
                            style: const TextStyle(
                                color: Colors.orange,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "Hide detail",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1.0,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                      child: SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Order Info",
                              style:
                              TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            Text(
                              widget.chosenEvent.buyerName,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 20.0),
                      child: SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Amount",
                              style:
                              TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            Text(
                              widget.chosenEvent.price,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 20.0),
                      child: SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Transaction Time",
                              style:
                              TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            Text(
                              todayDate,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ) ,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => const BottomNavigation(credential: null),
                    ));
                  },
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
      ) : const NotifDialog(information: "Error! Please complete all fills."),
    );
  }
}

