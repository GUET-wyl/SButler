// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:SButler/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
////////////////////
// Padding(
//             padding: EdgeInsets.only(
//               left: 14.w,
//               top: 55.h,
//               bottom: 59.h,
//             ),
//             child: Row(
//               children: [
//                 Container(
//                   width: 47.w,
//                   height: 47.w,
//                   child: Center(
//                     child: Image.asset(
//                       'assets/person.png',
//                       width: 38.w,
//                       height: 33.w,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   decoration: BoxDecoration(
//                     color: GlobalColor.cd5,
//                     borderRadius: BorderRadius.circular(23.5.w),
//                     border: Border.all(
//                       width: 2.w,
//                       color: GlobalColor.c3f,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 13.w,
//                 ),
//                 Text(
//                   '蛋蛋',
//                   style: TextStyle(
//                     color: GlobalColor.c3f,
//                     fontSize: 16.sp,
//                     fontFamily: 'PingFang SC',
//                     fontWeight: FontWeight.w500,
//                   ),
//                 )
//               ],
//             ),
//           ),