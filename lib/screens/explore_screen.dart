import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pfoten/utils/dimensions.dart';

import '../reuasble/customAppBar.dart';
import '../utils/colors.dart';
import '../utils/textStyles.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Explore",
        isBackButtonExist: true,
        isAction: false,
        backOnTap: () {
          Navigator.pop(context);
        },
        iconData: Icons.create_outlined,
        iconOnTap: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(Dimensions.paddingDefault, Dimensions.paddingDefault, Dimensions.paddingDefault, 0),
        child: GridView.custom(
          gridDelegate: SliverWovenGridDelegate.count(
            crossAxisCount: 2,
            mainAxisSpacing: 3,
            crossAxisSpacing: 8,
            pattern: [
              const WovenGridTile(1),
              const WovenGridTile(
                5 / 7,
                crossAxisRatio: 0.95,
                alignment: AlignmentDirectional.centerEnd,
              ),
            ],
          ),
          childrenDelegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(15)
                      ),
                    image: DecorationImage(image: AssetImage("images/test.jpg"), fit: BoxFit.cover)
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Animal Brain",
                        style: robotoBoldTextStyle.copyWith(
                            fontWeight: FontWeight.w900,
                            color: kColorWhite,
                            fontSize: Dimensions.fontSizeSmall
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
          ),
        ),
      )
    );
  }
}
