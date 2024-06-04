import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../Data/data.dart';

class ParticipationOrdersController extends GetxController with GetTickerProviderStateMixin{
  late TabController tabController;
  TextEditingController search=TextEditingController();

  UserX getUser(id)=>users.firstWhere((user) => user.latitude==id);

  List<ParticipationOrderX> participationOrders=[
    ParticipationOrderX(id: 0, userID: 0,orderID: 1, shareWith: 'x1'),
    // ParticipationOrderX(id: '2', userID: '2',orderID: '1', shareWith: 'x2'),
    // ParticipationOrderX(id: '3', userID: '3',orderID: '1', shareWith: 'x3'),
    // ParticipationOrderX(id: '4', userID: '4',orderID: '1', shareWith: 'x4',completionDate: '2023/7/13'),
    // ParticipationOrderX(id: '5', userID: '5',orderID: '1', shareWith: 'x5',completionDate: '2023/7/7'),
    // ParticipationOrderX(id: '6', userID: '6',orderID: '1', shareWith: 'x6',completionDate: '2023/7/2'),
  ];

  List<UserX> users= [UserX(latitude: 0,location: '',longitude: 0,isOnline: true, name: 'Saker', email: 'saker@gmail.com', phone: '+96654320342', image: 'https://scontent-lga3-1.xx.fbcdn.net/v/t39.30808-6/310798117_1959871264211613_7797590236957180637_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=pRb1l-P5YPUAX-hoSzj&_nc_ht=scontent-lga3-1.xx&oh=00_AfDvw8PFFDenqs1sw8O0U6f5G26VaEnDnRGSVZl3nLVgpw&oe=64B9B2B5', gender: '', birthDate: '', address: '')
    // UserX(id: '2', name: 'خالد',isOnline: true, email: 'saker@gmail.com', phone: '+96654320342', image: 'https://scontent-lga3-1.xx.fbcdn.net/v/t39.30808-6/310798117_1959871264211613_7797590236957180637_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=pRb1l-P5YPUAX-hoSzj&_nc_ht=scontent-lga3-1.xx&oh=00_AfDvw8PFFDenqs1sw8O0U6f5G26VaEnDnRGSVZl3nLVgpw&oe=64B9B2B5'),
    // UserX(id: '3', name: 'Ahmad',lastSeen: 60, email: 'saker@gmail.com', phone: '+96654320342',  image: 'https://scontent-lga3-1.xx.fbcdn.net/v/t39.30808-6/310798117_1959871264211613_7797590236957180637_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=pRb1l-P5YPUAX-hoSzj&_nc_ht=scontent-lga3-1.xx&oh=00_AfDvw8PFFDenqs1sw8O0U6f5G26VaEnDnRGSVZl3nLVgpw&oe=64B9B2B5'),
    // UserX(id: '4', name: 'وليد',lastSeen: 30, email: 'saker@gmail.com', phone: '+96654320342',  image: 'https://scontent-lga3-1.xx.fbcdn.net/v/t39.30808-6/310798117_1959871264211613_7797590236957180637_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=pRb1l-P5YPUAX-hoSzj&_nc_ht=scontent-lga3-1.xx&oh=00_AfDvw8PFFDenqs1sw8O0U6f5G26VaEnDnRGSVZl3nLVgpw&oe=64B9B2B5'),
    // UserX(id: '5', name: 'Yaser',isOnline: true, email: 'saker@gmail.com', phone: '+96654320342',  image: 'https://scontent-lga3-1.xx.fbcdn.net/v/t39.30808-6/310798117_1959871264211613_7797590236957180637_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=pRb1l-P5YPUAX-hoSzj&_nc_ht=scontent-lga3-1.xx&oh=00_AfDvw8PFFDenqs1sw8O0U6f5G26VaEnDnRGSVZl3nLVgpw&oe=64B9B2B5'),
    // UserX(id: '6', name: 'عبد الله',lastSeen: 120, email: 'saker@gmail.com', phone: '+96654320342',  image: 'https://scontent-lga3-1.xx.fbcdn.net/v/t39.30808-6/310798117_1959871264211613_7797590236957180637_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=pRb1l-P5YPUAX-hoSzj&_nc_ht=scontent-lga3-1.xx&oh=00_AfDvw8PFFDenqs1sw8O0U6f5G26VaEnDnRGSVZl3nLVgpw&oe=64B9B2B5'),
  ];

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}