import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/choose.dart';
import 'package:untitled/login.dart';
import 'package:untitled/style.dart';


class Onboarding_Screen extends StatefulWidget {
  @override
  _Onboarding_Screen createState() => _Onboarding_Screen();
}

class _Onboarding_Screen extends State<Onboarding_Screen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : const Color(0xFF443C68),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [

                Color(0xFF443C68),
                Color(0xFF635985),
                Color(0xFF635985),
                Color(0xFF443C68),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //skip container
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => print('Skip'),
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 600.0,
                  child: PageView(
                    physics: const ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      //page 1
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:  <Widget>[
                            const Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/news.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),

                            const SizedBox(height: 80.0),

                            Text(
                              'welcome To Our News app',
                              style: googleTopicWhite,
                            ),
                            const SizedBox(height: 20.0),
                            Text(
                              'Hope you find our app do well ,and help '
                                  'you to do what you want',
                              style: googleBodyWhite,
                            ),
                          ],
                        ),
                      ),
                      //page 2
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:  <Widget>[
                            const Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/login.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            const SizedBox(height: 80.0),
                            Text(
                              'You can login to app  ',
                              style: googleTopicWhite,
                            ),
                            const SizedBox(height: 20.0),
                            Text(
                              'To show all information and take all you want '
                                  ,
                              style: googleBodyWhite,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:  <Widget>[
                            const Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/register.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            const SizedBox(height: 80.0),
                            Text(
                              'Lets Start',
                              style: googleTopicWhite,
                            ),
                            const SizedBox(height: 20.0),
                            Text(
                              'Lets register and find out everything',
                              style: googleBodyWhite,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1
                    ? Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Text(
                            'Next',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                    : const Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
        height: 100.0,
        width: double.infinity,
        color: Colors.white,
        child: MaterialButton(
          onPressed: () =>
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return const Choose();
              })),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: Text(
                'Get started',
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      )
          : const Text(''),
    );
  }
}