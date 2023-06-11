import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shutter/screens/add_post_screen.dart';
import 'package:shutter/screens/feed_screen.dart';
import 'package:shutter/screens/profile_screen.dart';
import 'package:shutter/screens/search_screen.dart';

const webSreenSize = 600;
List<Widget> homeScreenItems = [
  const Feedscreen(),
  const SearchScreen(),
  const AddPostScreen(),
  const Text('notif'),
  ProfileScreen(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];
/*
uid: FirebaseAuth.instance.currentUser!.uid

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  const FeedScreen(),
  const SearchScreen(),
  const AddPostScreen(),
  const Text('notifications'),
  ProfileScreen(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];*/
 