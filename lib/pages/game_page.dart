import 'package:flutter/material.dart';
import 'package:flutter_samples/components/colors.dart';
import 'package:flutter_samples/helper/open_url.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        title: const Text('Download Gen Goals Game'),
        backgroundColor: AppColors.accentColor,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            openBrowserWebView('https://bit.ly/m/Gen-Goals');
          },
          child: const Text('Download Now'),
        ),
      ),
    );
  }
}
