import 'package:animations/animations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mcq/data/quiz_data.dart';
import 'package:mcq/data/user_data.dart';
import 'package:mcq/screens/welcome/welcome_page.dart';
import 'package:mcq/widgets/custom_listview.dart';
import 'package:mcq/widgets/custom_page_route_builder.dart';
import 'package:mcq/widgets/custom_shimmer.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  fetchUserdata() {
    Provider.of<UserData>(context, listen: false).getUserData();
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUserdata();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<UserData, QuizData>(
        builder: (context, provider, quizProvider, child) {
      var userdata = provider.userdata;
      return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
                child: Text(
                  'Account',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 36.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2.0,
                          color: Theme.of(context).hintColor,
                          style: BorderStyle.solid,
                          strokeAlign: BorderSide.strokeAlignInside),
                      borderRadius: BorderRadius.circular(
                        8.0,
                      ),
                      shape: BoxShape.rectangle),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                            backgroundImage:
                                const AssetImage('assets/images/user.png'),
                            radius: MediaQuery.of(context).size.width * 0.1,
                            backgroundColor: Colors.transparent),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: userdata != null
                                  ? Text(
                                      '${userdata.firstName} ${userdata.lastName}',
                                      style: const TextStyle(
                                          fontSize: 28.0,
                                          fontWeight: FontWeight.w500),
                                    )
                                  : showShimmer(
                                      context: context,
                                      height: 32.0,
                                      width: 150.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  children: <Widget>[
                    CustomListView(
                        icon: Icons.add_task_rounded,
                        onTap: () {
                          quizProvider.addQuestion();
                        },
                        text: 'Add questions'),
                    CustomListView(
                        icon: Icons.power_settings_new_rounded,
                        onTap: () {
                          signOut();
                          Navigator.pushAndRemoveUntil(
                              context,
                              CustomPageRouteBuilder(
                                  child: const WelcomePage(),
                                  transitionType:
                                      SharedAxisTransitionType.vertical),
                              (route) => false);
                        },
                        text: 'Log out'),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
