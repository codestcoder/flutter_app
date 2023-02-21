import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: <Widget>[
              _buildPage(
                  'Welcome',
                  'Welcome to my app!',
                  'assets/images/onboarding_1.png',
                  Colors.blue),
              _buildPage(
                  'Get Started',
                  'Get started by creating an account.',
                  'assets/images/onboarding_2.png',
                  Colors.green),
              _buildPage(
                  'Explore',
                  'Explore all the features of our app.',
                  'assets/images/onboarding_3.png',
                  Colors.orange),
            ],
          ),
          Positioned(
            bottom: 16.0,
            left: 16.0,
            child: Row(
              children: <Widget>[
                for (int i = 0; i < 3; i++)
                  _buildIndicator(i == _currentPage),
              ],
            ),
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: RaisedButton(
              onPressed: () {
                // Navigate to the next screen
              },
              child: Text(_currentPage == 2 ? 'Get Started' : 'Next'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(String title, String subtitle, String image, Color color) {
    return Container(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0),
          Text(
            subtitle,
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 32.0),
          Image.asset(image),
        ],
      ),
    );
  }

  Widget _buildIndicator(bool isActive) {
    return Container(
      margin: EdgeInsets.all(4.0),
      width: isActive ? 16.0 : 8.0,
      height: 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.grey,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}
