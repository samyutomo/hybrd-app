import 'package:flutter/material.dart';
import 'package:hybrd_app/database/event_database.dart';
import 'package:hybrd_app/models/schedule_event.dart';
import 'package:hybrd_app/pages/ticket.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  late List<ScheduledEvent> events;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshEvent();
  }

  @override
  void dispose() {
    EventDatabase.instance.close();
    super.dispose();
  }

  Future refreshEvent() async {
    setState(() => isLoading = true);
    events = await EventDatabase.instance.listAllEvents();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : events.isEmpty ? Stack(
          children: [
            Image.asset(
              'images/background.png',
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
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
                      "My Schedules",
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
        ) : Stack(
          children: [
            Image.asset(
              'images/background.png',
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
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
                      "My Schedules",
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
                  SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height - 210,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                events[index].eventName,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text("Order ID ${events[index].orderId}"),
                              Text("${events[index]
                                  .chosenDate} at ${events[index].chosenTime}"),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding:
                                        const EdgeInsets.symmetric(
                                            vertical: 8.0,
                                            horizontal: 12.0),
                                        decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius:
                                          BorderRadius.circular(
                                              16.0),
                                        ),
                                        child: const Text(
                                          'Ticket proccessed',
                                          style: TextStyle(
                                              color: Colors.white),
                                        ),
                                      ),
                                      events[index].isOnline
                                          ? const Padding(
                                        padding: EdgeInsets.only(
                                            left: 8.0),
                                        child: Icon(
                                          Icons.wifi,
                                          color: Colors.grey,
                                        ),
                                      )
                                          : const SizedBox()
                                    ],
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => TicketPage(detailEvent: events[index])));
                                    },
                                    style: ButtonStyle(
                                        side: MaterialStateProperty.all(
                                            const BorderSide(
                                                color: Color.fromRGBO(
                                                    16, 141, 232, 1.0),
                                                width: 1.5,
                                                style:
                                                BorderStyle.solid)),
                                        shape: MaterialStateProperty.all(
                                            const RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(
                                                        20))))),
                                    child: const Text(
                                      "View Details",
                                      style: TextStyle(
                                          color: Color.fromRGBO(
                                              16, 141, 232, 1.0)),
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                thickness: 1.0,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: events.length,
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),),);
  }
}
