import 'package:flutter/material.dart';

/// A collection of widgets intentionally designed with UI bugs for testing 
/// static analysis tools like CodeRabbit.
class BreakingUICases extends StatelessWidget {
  const BreakingUICases({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Breaking UI Cases')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text('Case 1: ListView inside Column without Expanded'),
            // ISSUE 1: ListView inside Column without Expanded/SizedBox 
            // will throw "Vertical viewport was given unbounded height".
            ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
            ),

            const Divider(),
            const Text('Case 2: Long Text inside Row without Expanded'),
            // ISSUE 2: Long text inside Row will cause a horizontal overflow.
            const Row(
              children: [
                Icon(Icons.warning),
                Text(
                  'This is an excessively long text that will definitely overflow the horizontal boundaries of the screen because it is not wrapped in an Expanded or Flexible widget.',
                ),
              ],
            ),

            const Divider(),
            const Text('Case 3: SingleChildScrollView with Expanded child'),
            // ISSUE 3: Expanded cannot be a child of SingleChildScrollView (indirectly via Column).
            // This throws "Incorrect use of ParentDataWidget".
            SingleChildScrollView(
              child: Column(
                children: [
                  Expanded(
                    child: Container(color: Colors.red, height: 100),
                  ),
                ],
              ),
            ),

            const Divider(),
            const Text('Case 4: ListView inside ListView without shrinkWrap'),
            // ISSUE 4: Nested scrollables without shrinkWrap: true or Fixed height 
            // will throw unbounded height error.
            ListView(
              children: [
                ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) => Text('Nested $index'),
                ),
              ],
            ),

            const Divider(),
            const Text('Case 5: Row inside Row with unbounded width'),
            // ISSUE 5: Similar to Case 2, but with another Row or scrollable.
            Row(
              children: [
                ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [Text('Horizontally scrollable')],
                ),
              ],
            ),

            const Divider(),
            const Text('Case 6: Stack with improperly positioned child'),
            // ISSUE 6: Using Positioned with both top/bottom and height, 
            // or outside a Stack.
            Container(
              height: 200,
              width: 200,
              child: const Positioned(
                top: 10,
                child: Text('I am not inside a Stack!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A complex widget with an inefficient build method.
class InefficientWidget extends StatefulWidget {
  const InefficientWidget({super.key});

  @override
  State<InefficientWidget> createState() => _InefficientWidgetState();
}

class _InefficientWidgetState extends State<InefficientWidget> {
  @override
  Widget build(BuildContext context) {
    // ISSUE 7: Inefficient build method.
    // Heavy calculations or huge widget tree constructions inside build().
    final heavyList = List.generate(1000, (index) => 'Item $index');
    final processedList = heavyList.map((e) => e.toUpperCase()).toList();

    return Column(
      children: [
        for (var item in processedList) Text(item),
      ],
    );
  }
}
