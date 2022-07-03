import 'package:flutter/material.dart';
import 'package:pfoten/reuasble/customCircleButton.dart';
import 'package:pfoten/utils/textStyles.dart';
import 'package:sizer/sizer.dart';
import '../reuasble/customAppBar.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';

class ExploreInnerScreen extends StatelessWidget {
  final int ind;
  final String tag;
  ExploreInnerScreen({Key? key, required this.ind, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red.withOpacity(0),
        leading: Padding(
          padding: const EdgeInsets.only(
              left: Dimensions.paddingDefault
          ),
          child: CustomCircleButton(
            iconData: Icons.arrow_back_ios,
            iconOnTap: (){
              Navigator.pop(context);
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: Dimensions.paddingOverLarge),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomCircleButton(
                  iconData: Icons.share,
                  iconOnTap: (){

                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: Dimensions.paddingLarge),
                  child: CustomCircleButton(
                    iconData: Icons.favorite,
                    iconOnTap: (){

                    },
                  )
                ),
              ],
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Padding(
                    padding: const EdgeInsets.fromLTRB(
                        Dimensions.paddingDefault,
                        Dimensions.paddingLarge,
                        Dimensions.paddingDefault,
                        Dimensions.paddingSmall
                    ),
                    child: Column(
                      children: [
                        Hero(
                          tag: "$tag$ind",
                          child: Material(
                            type: MaterialType.transparency,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(15)),
                              child: Image.asset(
                                'images/test.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingDefault),
                          child: SizedBox(
                            width: 100.w,
                            child: Text(
                              "$ind kshjdkfjladsj fljds lfjalsdjf lajsl fjald sjlfja lsdjf la",
                              style: robotoBoldTextStyle.copyWith(
                                fontSize: Dimensions.fontSizeLarge,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: '2 hours ago',
                                    style: robotoRegularTextStyle.copyWith(
                                      color: kColorBlack.withOpacity(0.8),
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' - Robert Nox',
                                    style: robotoRegularTextStyle.copyWith(
                                      color: kColorBlack,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingOverLarge),
                          child: Text(
                           'Okdkjfhksaj hfakjs dfhkajh sfjah skdjfhkda dhskf haksh fkahjd kfha'
                               'klah dkjfhakld hjsfk hadkjfh akj '
                               'lja lsfjkj laj sdlfjlajsdfa dfa dfl ajd lkjaj ldfjal jdfljakf '
                               'klaj lsdjkf lajds fjalsdjf lajdslf jalj dflj alsjdf jalsdkkjf lajsf jaljdf lakjd'
                               'kkjal djkfalj lsdfjal jdfljka lskjflajd lfjald jflkj adsljf lkadjsf lajejojrlef '
                               'jkfljs;dlfjkldsjkf aljksf;l kja;dfkj alkjdfajk d;fl jadf'
                               'klja ;ldjkf;lajksd l;fjasdkjf ;akjsdf;o lelugfdsfgdasgf akgsdfiu kasdiuufyhsidhf'
                               'shdfja fyaiduy foaid ofiaudf  fadshfkj \n\nahskdf a Okdkjfhksaj hfakjs dfhkajh sfjah skdjfhkda dhskf haksh fkahjd kfha'
                               'klah dkjfhakld hjsfk hadkjfh akj'
                               'lja lsfjkj laj sdlfjlajsdfa dfa dfl ajd lkjaj ldfjal jdfljakf '
                               'klaj lsdjkf lajds fjalsdjf lajdslf jalj dflj alsjdf jalsdkkjf lajsf jaljdf lakjd'
                               'kkjal djkfalj lsdfjal jdfljka lskjflajd lfjald jflkj adsljf lkadjsf lajejojrlef '
                               'jkfljs;dlfjkldsjkf aljksf;l kja;dfkj alkjdfajk d;fl jadf'
                               'klja ;ldjkf;lajksd l;fjasdkjf ;akjsdf;o lelugfdsfgdasgf akgsdfiu kasdiuufyhsidhf'
                               'shdfja fyaiduy foaid ofiaudf  fadshfkj ahskdf a',
                            style: robotoBoldTextStyle.copyWith(
                              color: kColorBlack.withOpacity(0.8),
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.9,
                              height: 1.3
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    )
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildList(int count) {
    List<Widget> listItems = [];

    for (int i = 0; i < count; i++) {
      listItems.add(Padding(padding: const EdgeInsets.all(20.0),
          child: Text(
              'Item ${i.toString()}',
              style: const TextStyle(fontSize: 25.0)
          )
      ));
    }

    return listItems;
  }

}