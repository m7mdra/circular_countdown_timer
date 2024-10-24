import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Circular Countdown Timer Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Circular Countdown Timer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, this.title});

  final String? title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final int _duration = 15;
  final CountDownController _controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
        child: CircularCountDownTimer(
          // Countdown duration in Seconds.
          duration: _duration,

          // Countdown initial elapsed Duration in Seconds.
          initialDuration: 0,

          // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
          controller: _controller,

          // Width of the Countdown Widget.
          width: 300,

          // Height of the Countdown Widget.
          height: 300,

          // Ring Color for Countdown Widget.
          ringColor: Colors.white,

          // Ring Gradient for Countdown Widget.
          ringGradient: null,

          // Filling Color for Countdown Widget.
          fillColor: Color(0xff9957F6),
          trackColor: Color(0xffEBDDFF),

          // Filling Gradient for Countdown Widget.
          fillGradient: null,

          // Background Color for Countdown Widget.
          backgroundColor: Colors.white,

          // Background Gradient for Countdown Widget.
          backgroundGradient: null,

          // Border Thickness of the Countdown Ring.
          strokeWidth: 20.0,

          // Begin and end contours with a flat edge and no extension.
          strokeCap: StrokeCap.square,

          // Text Style for Countdown Text.
          textStyle: const TextStyle(
            fontSize: 33.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 3.0,
          ),

          // Format for the Countdown Text.
          textFormat: CountdownTextFormat.MM_SS,

          // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
          isReverse: true,

          // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
          isReverseAnimation: true,

          // Handles visibility of the Countdown Text.
          isTimerTextShown: true,

          // Handles the timer start.
          autoStart: true,

          // This Callback will execute when the Countdown Starts.
          onStart: () {
            // Here, do whatever you want
            debugPrint('Countdown Started');
          },

          // This Callback will execute when the Countdown Ends.
          onComplete: () {
            // Here, do whatever you want
            debugPrint('Countdown Ended');
          },

          // timeFormatterFunction: (defaultFormatterFunction, duration) {
          //   if (duration.inSeconds == 0) {
          //     //only format for '0'
          //     return "Start";
          //   } else {
          //     //others durations by it's default format
          //     return Function.apply(defaultFormatterFunction, [duration]);
          //   }
          // },

          // This Callback will execute when the Countdown Changes.
          onChange: (String timeStamp) {
            // Here, do whatever you want
            debugPrint('Countdown Changed $timeStamp');
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 30,
          ),
          _button(
            title: "Start",
            onPressed: () => _controller.start(),
          ),
          const SizedBox(
            width: 10,
          ),
          _button(
            title: "Pause",
            onPressed: () {
              _controller.pause();
              debugPrint("Pause ${_controller.isPaused}");
              debugPrint("Resume ${_controller.isResumed}");
            },
          ),
          const SizedBox(
            width: 10,
          ),
          _button(
            title: "Resume",
            onPressed: () {
              _controller.resume();
              debugPrint("Pause ${_controller.isPaused}");
              debugPrint("Resume ${_controller.isResumed}");
            },
          ),
          const SizedBox(
            width: 10,
          ),
          _button(
            title: "Restart",
            onPressed: () => _controller.restart(duration: _duration),
          ),
        ],
      ),
    );
  }

  Widget _button({required String title, VoidCallback? onPressed}) {
    return Expanded(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.purple),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
