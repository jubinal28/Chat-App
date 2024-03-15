import 'package:flutter/material.dart';
import 'package:onboarding/dashboard/chat/chat_list_item.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();
  late FocusNode _focusNode;

  List<Chatlist> foundUsers = [];
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.requestFocus();
    foundUsers = chatmessList;
    searchController.addListener(() {
      setState(() {
        isSearching = searchController.text.isNotEmpty;
      });
      _runFilter(searchController.text);
    });
  }

  void _runFilter(String enteredKeyword) {
    List<Chatlist> results = [];
    if (enteredKeyword.isEmpty) {
      results = [];
    } else {
      results = chatmessList.where((chat) {
            String fullName = "${chat.fname} ${chat.lname}";
            return fullName.toLowerCase().contains(enteredKeyword.toLowerCase());
        }).toList();
    setState(() {
      foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          'Search',
          style: TextStyle(color: Color(0xFF000000)),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56.0),
          child: Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
            child: TextFormField(
              controller: searchController,
              focusNode: _focusNode,
              decoration: InputDecoration(
                hintText: 'Search',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: () {
                    searchController.clear();
                    setState(() {
                      isSearching = false;
                    });
                  },
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: isSearching
            ? ListView.builder(
                itemCount: foundUsers.length,
                itemBuilder: (context, index) {
                  var data = foundUsers[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
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
                                Text(
                                  '${data.fname} ${data.lname}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
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
              )
            : Container(),
      ),
    );
  }
}
