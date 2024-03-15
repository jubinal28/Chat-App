import 'package:flutter/material.dart';

// Dummy data for chat heads
List<ChatHead> chatheadList = [
  ChatHead(
    imagePath: 'assets/images/profile1.jpg',
    fname: 'John',
    lname: 'Doe',
    message: 'Hello there!',
    unreadCount: 3,
    time: '10:30 AM',
  ),
  ChatHead(
    imagePath: 'assets/images/profile2.jpg',
    fname: 'Jane',
    lname: 'Smith',
    message: 'Hi, how are you?',
    unreadCount: 0,
    time: 'Yesterday',
  ),
  // Add more dummy data as needed
];

class ChatHead {
  final String imagePath;
  final String fname;
  final String lname;
  final String message;
  final int unreadCount;
  final String time;

  ChatHead({
    required this.imagePath,
    required this.fname,
    required this.lname,
    required this.message,
    required this.unreadCount,
    required this.time,
  });
}

class DashboardChats extends StatefulWidget {
  const DashboardChats({super.key});

  @override
  State<DashboardChats> createState() => _DashboardChatsState();
}

class _DashboardChatsState extends State<DashboardChats> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Chats'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(padding: EdgeInsets.all(15)),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: chatheadList.length,
                  itemBuilder: (context, index) {
                    var data = chatheadList[index];
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(99),
                                child: Image.asset(
                                  data.imagePath,
                                  height: 45,
                                  width: 45,
                                ),
                              ),
                              if (data.unreadCount > 0)
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF4CAF50),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${data.unreadCount}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          Container(
                            width: 70,
                            alignment: Alignment.center,
                            child: Text(
                              '${data.fname} ${data.lname}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Text(
                            data.message,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            data.time,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: chatheadList.length, // Change itemCount to chatheadList.length
                  itemBuilder: (context, index) {
                    var data = chatheadList[index];
                    return Padding(
                      padding: const EdgeInsets.all(2),
                      child: Container(
                        height: 80,
                        color: const Color.fromARGB(119, 231, 231, 231),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 60,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(99),
                                child: Image.asset(
                                  data.imagePath,
                                  height: 60,
                                  width: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${data.fname} ${data.lname}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    data.message,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  data.time,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (data.unreadCount > 0)
                                  Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      '${data.unreadCount}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
