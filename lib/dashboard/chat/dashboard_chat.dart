import 'package:flutter/material.dart';
import 'package:onboarding/dashboard/chat/chat_list_item.dart';
import 'package:onboarding/dashboard/search/search_page.dart';

class DashboardChats extends StatefulWidget {
  const DashboardChats({super.key});

  @override
  State<DashboardChats> createState() => _DashboardChatsState();
}

class _DashboardChatsState extends State<DashboardChats> {



  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20,),
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Chats',
              style: TextStyle(color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: Padding(
                padding: const EdgeInsets.only(
                      left: 12,
                      top: 10,
                      right: 45,
                      bottom: 10,
                      ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SearchPage()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 5,
                      top: 10,
                      bottom: 10,
                      ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey),
                      color: const Color(0xFFBDBDBD),
                    ),
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Icon(Icons.search),
                        ),
                        Text(
                          'Search',
                          style: TextStyle(color: Color(0xFF828282)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Padding(padding: EdgeInsets.all(5)),
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: chatheadList.length,
                          itemBuilder: (context, index) {
                            var data = chatheadList[index];
                            return Column(
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
                                    if (data.isActive == true)
                                      Container(
                                        width: 12,
                                        height: 12,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xFF4CAF50),
                                        ),
                                      ),
                                  ],
                                ),
                                Container(
                                  width: 70,
                                  alignment: Alignment.center,
                                  child: Text(
                                    data.fname,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Text(
                                  data.lname,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: chatmessList.length,
                          itemBuilder: (context, index) {
                            var data = chatmessList[index];
                            return Padding(
                              padding: const EdgeInsets.only(left: 12, right: 12,),
                              child: Container(
                                height: 80,
                                color: Colors.white,
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
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '${data.fname} ${data.lname}',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              if (data.unreadCount! > 0)
                                                Container(
                                                  padding: const EdgeInsets.all(4),
                                                  decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xFF5B2A9A),
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
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                data.message ?? '',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Color.fromARGB(255, 0, 0, 0),
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              SizedBox(
                                                width: 60,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      data.time ?? '',
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
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
            ),
          ),
        ),
      ),
    );
  }
}
