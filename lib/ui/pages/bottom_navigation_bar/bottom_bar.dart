import 'package:flutter/material.dart';
import 'chats_page.dart';
import 'contact_page.dart';
import 'more_page.dart';


class BottomBar extends StatefulWidget {
  static const String id = "bottom_bar";
  int initialIndex;

  BottomBar({super.key, required this.initialIndex});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
    if (widget.initialIndex == 0) {
      currentIndex = 0;
    } else if (widget.initialIndex == 1) {
      currentIndex = 1;
    } else if (widget.initialIndex == 2) {
      currentIndex = 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          fit: StackFit.passthrough,
          children: [
            PageView(
              controller: _pageController,
              children: const [
                ContactPage(),
                ChatsPage(),
                MorePage(),
              ],
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    padding: EdgeInsets.only(),
                    height: 44,
                    width: double.infinity,
                    color: Colors.white,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _pageController.jumpToPage(0);
                                currentIndex = 0;
                              });
                            },
                            child: currentIndex == 0
                                ? Column(
                              children: [
                                const Text(
                                  "Contacts",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                                Container(
                                  height: 5,
                                  width: 5,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                )
                              ],
                            )
                                : const Icon(Icons.people_alt_outlined),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _pageController.jumpToPage(1);
                                currentIndex = 1;
                              });
                            },
                            child: currentIndex == 1
                                ? Column(
                              children: [
                                const Text(
                                  "Chats",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                                Container(
                                  height: 5,
                                  width: 5,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                )
                              ],
                            )
                                : const Icon(Icons.messenger_outline),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _pageController.jumpToPage(2);
                                currentIndex = 2;
                              });
                            },
                            child: currentIndex == 2
                                ? Column(
                              children: [
                                const Text(
                                  "More",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                                Container(
                                  height: 5,
                                  width: 5,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                )
                              ],
                            )
                                : const Icon(Icons.more_horiz),
                          ),
                        ],
                      ),
                    )),
              ],
            )
          ],
        ));
  }

}
