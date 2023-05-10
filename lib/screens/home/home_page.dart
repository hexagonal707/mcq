import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mcq/data/quiz_data.dart';
import 'package:mcq/screens/account/account_page.dart';
import 'package:mcq/screens/quiz/quiz_page.dart';
import 'package:mcq/widgets/custom_page_route_builder.dart';
import 'package:provider/provider.dart';

import '../../data/user_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  fetchUserdata() {
    Provider.of<UserData>(context, listen: false).getUserData();
    Provider.of<QuizData>(context, listen: false).getQuizData();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUserdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              tooltip: 'Account',
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return SharedAxisTransition(
                        animation: animation,
                        secondaryAnimation: secondaryAnimation,
                        transitionType: SharedAxisTransitionType.horizontal,
                        child: child,
                      );
                    },
                    pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) =>
                        const AccountPage(),
                  ),
                );
              },
              icon: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/user.png'),
                radius: 18.0,
                backgroundColor: Colors.blue,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Lottie.asset('assets/lottie/quiz.json'),
              const Padding(
                padding: EdgeInsets.only(bottom: 36.0),
                child: Text(
                  'Personal Best Score: 25',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 26.0),
                ),
              ),
              FilledButton(
                  style: const ButtonStyle(),
                  onPressed: () {
                    Navigator.push(
                      context,
                      CustomPageRouteBuilder(
                          child: const QuizPage(),
                          transitionType: SharedAxisTransitionType.horizontal),
                    );
                  },
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 26.0, vertical: 8.0),
                    child: Text(
                      'Start Quiz',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 22.0),
                    ),
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
