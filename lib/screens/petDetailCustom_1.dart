import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  PageController? _controller;

  // _goToDetail(Character character) {
  //   final page = DetailPage(character: character);
  //   Navigator.of(context).push(
  //     PageRouteBuilder<Null>(
  //         pageBuilder: (BuildContext context, Animation<double> animation,
  //             Animation<double> secondaryAnimation) {
  //           return AnimatedBuilder(
  //               animation: animation,
  //               builder: (BuildContext context, Widget? child) {
  //                 return Opacity(
  //                   opacity: animation.value,
  //                   child: page,
  //                 );
  //               });
  //         },
  //         transitionDuration: Duration(milliseconds: 400)),
  //   );
  // }

  _pageListener() {
    setState(() {});
  }

  @override
  void initState() {
    _controller = PageController(viewportFraction: 0.5);
    _controller!.addListener(_pageListener);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.removeListener(_pageListener);
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dragon Ball"),
        backgroundColor: Colors.black54,
      ),
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          controller: _controller,
          itemCount: characters.length,
          itemBuilder: (context, index) {
            double? currentPage = 0;
            try {
              currentPage = _controller!.page;
            } catch (_) {}

            final num resizeFactor =
            (1 - (((currentPage! - index).abs() * 0.3).clamp(0.0, 1.0)));
            final currentCharacter = characters[index];
            return ListItem(
              character: currentCharacter,
              resizeFactor: resizeFactor as double,
              // onTap: () => _goToDetail(currentCharacter),
            );
          }),
    );
  }
}

class ListItem extends StatelessWidget {
  final Character character;
  final double resizeFactor;
  // final VoidCallback onTap;

  const ListItem({
    Key? key,
    required this.character,
    required this.resizeFactor,
    // required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.4;
    double width = MediaQuery.of(context).size.width * 0.85;
    return InkWell(
      // onTap: onTap,
      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
            width: width * resizeFactor,
            height: height * resizeFactor,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: height / 4,
                  bottom: 0,
                  child: Hero(
                    tag: "background_${character.title}",
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: DecoratedBox(
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          margin: const EdgeInsets.only(
                            left: 20,
                            bottom: 10,
                          ),
                          child: Text(
                            character.title!,
                            style: TextStyle(
                              fontSize: 24 * resizeFactor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(character.color!),
                                  Colors.white,
                                ],
                                stops: const [
                                  0.4,
                                  1.0,
                                ])),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Hero(
                    tag: "image_${character.title}",
                    child: Image.asset(
                      character.avatar!,
                      width: width / 2,
                      height: height,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class Character {
  final String? avatar;
  final String? title;
  final String? description;
  final int? color;

  Character({
    this.avatar,
    this.title,
    this.description,
    this.color,
  });
}

//source: https://www.giantbomb.com/dragon-ball-z/3025-159/characters/
final characters = <Character>[
  Character(
    title: "Goku",
    description:
    "Goku is the main protagonist in the Dragon Ball franchise and one of the strongest fighters in the universe. He is a Saiyan warrior whose original name was Kakarot, son of Bardock. He is the husband of Chi Chi, and the father of Gohan and Goten. He is also Grandfather to Pan.",
    avatar: "images/cat.png",
    color: 0xFFE83835,
  ),
  Character(
    title: "Vegeta",
    description:
    "The Prince of all Saiyans, Vegeta is an incredibly strong elite Saiyan warrior. In his constant struggle to surpass his eternal rival Goku, he has become one of the most powerful fighters in the universe.",
    avatar: "images/dog.png",
    color: 0xFF238BD0,
  ),
  Character(
    title: "Gohan",
    description:
    "Gohan is Goku's son and one of the heroes in the Dragon Ball Z universe. He is also the protagonist of the Cell Saga, where he is the first to reach the Super Saiyan 2 form, through immense anger and emotion. In his later Ultimate form, he is considered the most powerful warrior in Dragon Ball Z. He is Goten's older brother and the father of Pan. His wife is Videl and his grandfathers are Ox-king and Bardock, respectively.",
    avatar: "images/cat.png",
    color: 0xFF354C6C,
  ),
  Character(
    title: "Frieza",
    description:
    "In the Dragon Ball Z universe, Frieza is one of the first villains to really test Goku.",
    avatar: "images/dog.png",
    color: 0xFF6F2B62,
  ),
  Character(
    title: "Cell",
    description:
    "Cell is an android constructed from cells taken from various fighters of the Dragon Ball Z universe. He is the main antagonist of the Android Saga of Dragon Ball.",
    avatar: "images/cat.png",
    color: 0xFF447C12,
  ),
  Character(
    title: "Majin Buu",
    description:
    "One of Dragon Ball Z's most ferocious and transformation-happy of characters, Majin Buu is the last major enemy in the Dragon Ball Z storyline. With the ability to absorb foes, learn moves, and deliver a serious punch, Majin Buu is one of Goku and friends' most challenging of enemies.",
    avatar: "images/dog.png",
    color: 0xFFE7668E,
  ),
  Character(
    title: "Broly",
    description:
    "The Legendary Super Saiyan from myth, Broly is one of the Dragon Ball Z franchise's most powerful and destructive Saiyan villains.",
    avatar: "images/cat.png",
    color: 0xFFBD9158,
  ),
];