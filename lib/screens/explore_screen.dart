import 'package:flutter/material.dart';
import 'package:pfoten/utils/dimensions.dart';
import 'package:sizer/sizer.dart';
import '../reuasble/customAppBar.dart';
import '../utils/colors.dart';
import '../utils/textStyles.dart';
import 'exploreInner_screen.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Explore Tips",
        isBackButtonExist: false,
        isAction: false,
        backOnTap: () {
          Navigator.pop(context);
        },
        iconData: Icons.create_outlined,
        iconOnTap: () {},
      ),
      body: CustomScrollView(
       slivers: [
         SliverList(
           delegate: SliverChildBuilderDelegate(
                 (BuildContext context, int index) {
               return Padding(
                   padding: const EdgeInsets.symmetric(
                       horizontal :Dimensions.paddingDefault,
                       vertical: Dimensions.paddingLarge),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       Text(
                         "Popular",
                         style: robotoBoldTextStyle.copyWith(
                           fontSize: Dimensions.fontSizeLarge,
                           letterSpacing: 1,
                         ),
                       ),
                       Text(
                         "Trending",
                         style: robotoRegularTextStyle.copyWith(
                           color: kColorBlack.withOpacity(0.8),
                           letterSpacing: 1,
                         ),
                       ),
                       Text(
                         "Recent",
                         style: robotoRegularTextStyle.copyWith(
                           color: kColorBlack.withOpacity(0.8),
                           letterSpacing: 1,
                         ),
                       ),
                     ],
                   ));
             },
             childCount: 1,
           ),
         ),
         SliverToBoxAdapter(
           child: SizedBox(
             height: 40.h,
             child: ListView.builder(
               itemCount: 100,
               shrinkWrap: true,
               padding: const EdgeInsets.only(left: Dimensions.paddingDefault),
               scrollDirection: Axis.horizontal,
               itemBuilder: (context, index) {
                 return Padding(
                   padding: const EdgeInsets.only(right: Dimensions.paddingLarge),
                   child: Container(
                     width: 80.w,
                     decoration: BoxDecoration(
                       borderRadius: const BorderRadius.all(Radius.circular(10)),
                       border: Border.all(color: kColorGrey.withOpacity(0.8)),
                     ),
                     padding: const EdgeInsets.all(Dimensions.paddingSmall),
                     child: GestureDetector(
                       onTap: (){
                         Navigator.push(
                             context,
                             PageRouteBuilder(
                                 transitionDuration: const Duration(milliseconds: 800),
                                 pageBuilder: (_, __, ___) => ExploreInnerScreen(ind: index, tag: "top",)));
                       },
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Hero(
                             tag: "top$index",
                             child: Material(
                               type: MaterialType.transparency,
                               child: ClipRRect(
                                 borderRadius: const BorderRadius.only(
                                   topLeft: Radius.circular(15),
                                   topRight: Radius.circular(15),
                                 ),
                                 child: Image.asset(
                                   "images/test.jpg",
                                   fit: BoxFit.cover,
                                   height: 25.h,
                                   width: 50.h,
                                 ),
                               ),
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(top: 8.0),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 SizedBox(
                                   width: 70.w,
                                   child: Text(
                                     "$index kshjdkfjladsj fljds lfjalsdjf lajsl fjald sjlfja lsdjf la",
                                     style: robotoBoldTextStyle.copyWith(
                                       fontSize: Dimensions.fontSizeLarge,
                                       fontWeight: FontWeight.w600,
                                       letterSpacing: 1,
                                     ),
                                     maxLines: 2,
                                     overflow: TextOverflow.ellipsis,
                                   ),
                                 ),
                                 SizedBox(
                                   height: 2.h,
                                 ),
                                 SizedBox(
                                   width: 50.w,
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Text(
                                         "2 hours ago",
                                         style: robotoRegularTextStyle.copyWith(
                                           color: kColorBlack.withOpacity(0.8),
                                           letterSpacing: 1,
                                         ),
                                         maxLines: 2,
                                         overflow: TextOverflow.ellipsis,
                                       ),
                                       Text(
                                         "10 min read",
                                         style: robotoRegularTextStyle.copyWith(
                                           color: kColorBlack.withOpacity(0.8),
                                           letterSpacing: 1,
                                         ),
                                         maxLines: 2,
                                         overflow: TextOverflow.ellipsis,
                                       ),
                                     ],
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         ],
                       ),
                     ),
                   ),
                 );
               },
             ),
           ),
         ),
         SliverList(
           delegate: SliverChildBuilderDelegate(
                 (BuildContext context, int index) {
               return Padding(
                 padding: const EdgeInsets.fromLTRB(
                     Dimensions.paddingDefault,
                     Dimensions.paddingExtraLarge,
                     Dimensions.paddingLarge,
                     Dimensions.paddingSmall
                 ),
                 child: Text(
                 "Based on your history",
                 style: robotoBoldTextStyle.copyWith(
                   fontSize: Dimensions.fontSizeDefault,
                   color: kColorBlack.withOpacity(0.8),
                   letterSpacing: 1,
                   ),
               ));
             },
             childCount: 1,
           ),
         ),
         SliverList(
           delegate: SliverChildBuilderDelegate(
                 (BuildContext context, int ind) {
               return Padding(
                 padding: const EdgeInsets.fromLTRB(Dimensions.paddingSmall, Dimensions.paddingSmall, Dimensions.paddingSmall, 0),
                 child: Container(
                   height: 19.h,
                   decoration: BoxDecoration(
                       borderRadius: const BorderRadius.all(Radius.circular(10)),
                       border: Border.all(color: kColorGrey.withOpacity(0.8)),
                   ),
                   child: GestureDetector(
                     onTap: (){
                       Navigator.push(
                           context,
                           PageRouteBuilder(
                               transitionDuration: const Duration(milliseconds: 800),
                               pageBuilder: (_, __, ___) => ExploreInnerScreen(ind: ind, tag: "bottom",)));
                     },
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         Padding(
                           padding: const EdgeInsets.all(Dimensions.paddingSmall),
                           child: Hero(
                             tag: "bottom$ind",
                             child: Material(
                               type: MaterialType.transparency,
                               child: ClipRRect(
                                 borderRadius: const BorderRadius.all(Radius.circular(10)),
                                 child: Image.asset(
                                   "images/test.jpg",
                                   fit: BoxFit.cover,
                                   height: 17.h,
                                   width: 15.h,
                                 ),
                               ),
                             ),
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.fromLTRB(0, Dimensions.paddingSmall, Dimensions.paddingSmall, Dimensions.paddingSmall),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               SizedBox(
                                 width: 50.w,
                                 child: Text(
                                   "$ind kshjdkfjladsj fljds lfjalsdjf lajsl fjald sjlfja lsdjf la",
                                   style: robotoBoldTextStyle.copyWith(
                                       fontSize: Dimensions.fontSizeLarge,
                                       fontWeight: FontWeight.w600,
                                       letterSpacing: 1,
                                   ),
                                   maxLines: 2,
                                   overflow: TextOverflow.ellipsis,
                                 ),
                               ),
                               SizedBox(
                                 height: 1.h,
                               ),
                               SizedBox(
                                 width: 50.w,
                                 child: Text(
                                   "kshjdkfjlfja lsdjf lfsdfsd sdfs a",
                                   style: robotoRegularTextStyle.copyWith(
                                     color: kColorBlack.withOpacity(0.8),
                                     letterSpacing: 1,
                                   ),
                                   maxLines: 2,
                                   overflow: TextOverflow.ellipsis,
                                 ),
                               ),
                               SizedBox(
                                 height: 1.h,
                               ),
                               SizedBox(
                                 width: 50.w,
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Text(
                                       "2 hours ago",
                                       style: robotoRegularTextStyle.copyWith(
                                         color: kColorBlack.withOpacity(0.8),
                                         letterSpacing: 1,
                                       ),
                                     ),
                                     Text(
                                       "10 min read",
                                       style: robotoRegularTextStyle.copyWith(
                                         color: kColorBlack.withOpacity(0.8),
                                         letterSpacing: 1,
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                             ],
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),
               );
             },
             childCount: 100,
           ),
         ),
       ],
      )
    );
  }
}

// GridView.custom(
//   gridDelegate: SliverWovenGridDelegate.count(
//     crossAxisCount: 2,
//     mainAxisSpacing: 3,
//     crossAxisSpacing: 8,
//     pattern: [
//       const WovenGridTile(1),
//       const WovenGridTile(
//         5 / 7,
//         crossAxisRatio: 0.95,
//         alignment: AlignmentDirectional.centerEnd,
//       ),
//     ],
//   ),
//   childrenDelegate: SliverChildBuilderDelegate(
//         (context, index) => GestureDetector(
//           onTap: (){
//             Navigator.push(context,
//                 PageRouteBuilder(
//                     transitionDuration: const Duration(milliseconds: 800),
//                     pageBuilder: (_, __, ___) => ExploreInnerScreen(index: index),
//                 ),
//             );
//           },
//           child: Hero(
//             tag: "explore$index",
//             child: Material(
//               type: MaterialType.transparency,
//               child: Container(
//                 decoration: const BoxDecoration(
//                     borderRadius: BorderRadius.all(
//                         Radius.circular(15)
//                     ),
//                   image: DecorationImage(image: AssetImage("images/test.jpg"), fit: BoxFit.cover)
//                 ),
//                 child: Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 8.0),
//                     child: Text(
//                       "Animal Brain",
//                       style: robotoBoldTextStyle.copyWith(
//                           fontWeight: FontWeight.w900,
//                           color: kColorWhite,
//                           fontSize: Dimensions.fontSizeSmall
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//   ),
// ),