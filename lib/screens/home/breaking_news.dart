import 'package:flutter/material.dart';
import 'dart:async';

class BreakingNews extends StatefulWidget {
  const BreakingNews({super.key});

  @override
  State<BreakingNews> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {
  final List<String> breakingNews = [
    "🕉️ उत्तर भारत में भगवान शिव के 10 मंदिर जिन्हें आपको अवश्य देखना चाहिए",
    "🚀 Google Gemini स्टूडेंट ऑफर: जानिए सबकुछ (2025 संस्करण)",
    "Khaber Box के इस लेख में हम बताएंगे कि Gemini क्या है",
    "Google DeepMind द्वारा बनाया गया Google Gemini एक शक्तिशाली AI मॉडल है"
  ];

  int currentIndex = 0;
  Timer? timer;
  bool showBanner = true;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 3), (t) {
      setState(() {
        currentIndex = (currentIndex + 1) % breakingNews.length;
      });
    });
  }

  void showNext() {
    setState(() {
      currentIndex = (currentIndex + 1) % breakingNews.length;
    });
  }

  void showPrev() {
    setState(() {
      currentIndex =
          (currentIndex - 1 + breakingNews.length) % breakingNews.length;
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!showBanner) return SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffbb0707),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: showPrev,
            child: Icon(Icons.arrow_back_ios_new,
                color: Colors.white, semanticLabel: 'Previous News'),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: ClipRect(
              child: GestureDetector(
                onTap: () => print(breakingNews[currentIndex]),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder: (child, animation) => SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1, 0),
                      end: Offset(0, 0),
                    ).animate(animation),
                    child: FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  ),
                  child: Text(
                    breakingNews[currentIndex],
                    key: ValueKey(currentIndex),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: showNext,
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              semanticLabel: 'Next News',
            ),
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: () => setState(() => showBanner = false),
            child: Icon(
              Icons.close,
              color: Colors.white,
              semanticLabel: 'Close Banner',
            ),
          ),
        ],
      ),
    );
  }
}
