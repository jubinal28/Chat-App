
class Chathead {
  final String imagePath;
  final String fname;
  final String lname;
  final bool? isActive;

  Chathead({
    required this.imagePath,
    required this.fname,
    required this.lname,
    this.isActive,
    });
}


class Chatlist {
  final String imagePath;
  final String fname;
  final String lname;
  final String? message;
  final int? unreadCount;
  final String? time;

  Chatlist({
    required this.imagePath,
    required this.fname,
    required this.lname,
    this.message,
    this.unreadCount,
    this.time,
  });
}

List<Chathead> chatheadList = [
    Chathead(
      imagePath: 'assets/images/prof1.jpg', 
      fname: 'Dominic', 
      lname: 'Jubinal',
      isActive: false,
      ),
    Chathead(
      imagePath: 'assets/images/prof2.jpg', 
      fname: 'Dominic', 
      lname: 'Jubinal',
      isActive: true,
      ),
    Chathead(
      imagePath: 'assets/images/prof3.jpg', 
      fname: 'Dominic', 
      lname: 'Jubinal',
      isActive: true,
      ),
    Chathead(
      imagePath: 'assets/images/prof4.jpg', 
      fname: 'Dominic', 
      lname: 'Jubinal',
      isActive: true,),
    Chathead(
      imagePath: 'assets/images/prof5.jpg', 
      fname: 'Dominic', 
      lname: 'Jubinal',
      isActive: true,
      ),
    Chathead(
      imagePath: 'assets/images/prof6.jpg', 
      fname: 'Dominic', 
      lname: 'Jubinal',
      isActive: true,
      ),
    Chathead(
      imagePath: 'assets/images/prof7.jpg', 
      fname: 'Dominic', 
      lname: 'Jubinal',
      isActive: true,
      ),
    Chathead(
      imagePath: 'assets/images/prof7.jpg', 
      fname: 'Dominic', 
      lname: 'Jubinal',
      isActive: true,
      ),
  ];

List<Chatlist> chatmessList = [
  Chatlist(
    imagePath: 'assets/images/prof1.jpg',
    fname: 'Dominic Dominic',
    lname: 'Jubinal',
    message: 'Hello there!',
    unreadCount: 0,
    time: '10:30 AM',
  ),
  Chatlist(
    imagePath: 'assets/images/prof2.jpg',
    fname: 'Jordan',
    lname: 'Jubinal',
    message: 'Hi, how are you?',
    unreadCount: 0,
    time: 'Yesterday',
  ),
  Chatlist(
    imagePath: 'assets/images/prof3.jpg',
    fname: 'Hazel',
    lname: 'Jubinal',
    message: 'Hello there!',
    unreadCount: 33,
    time: '10:30 AM',
  ),
  Chatlist(
    imagePath: 'assets/images/prof4.jpg',
    fname: 'Manuela',
    lname: 'Jubinal',
    message: 'Hi, how are you?',
    unreadCount: 10,
    time: 'Yesterday',
  ),
  Chatlist(
    imagePath: 'assets/images/prof5.jpg',
    fname: 'Nathalia',
    lname: 'Jubinal',
    message: 'Hello there!',
    unreadCount: 1,
    time: '10:30 AM',
  ),
  Chatlist(
    imagePath: 'assets/images/prof6.jpg',
    fname: 'Manuel',
    lname: 'Jubinal',
    message: 'Hi, how are you?',
    unreadCount: 0,
    time: 'Yesterday',
  ),
  Chatlist(
    imagePath: 'assets/images/prof7.jpg',
    fname: 'Lester James',
    lname: 'Jubinal',
    message: 'Hello there!',
    unreadCount: 3,
    time: '10:30 AM',
    
  ),
  Chatlist(
    imagePath: 'assets/images/prof7.jpg',
    fname: 'Alfonso',
    lname: 'Jubinal',
    message: 'Hi, how are you?',
    unreadCount: 0,
    time: 'Yesterday',
  ),
];