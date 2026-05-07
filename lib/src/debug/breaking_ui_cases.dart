import 'package:flutter/material.dart';

class BreakingUICases extends StatelessWidget {
  const BreakingUICases({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Breaking UI Cases')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          CaseSection(title: 'Case 1: Vertical Unbounded Height', child: Case1VerticalUnbounded()),
          Divider(),
          CaseSection(title: 'Case 2: Horizontal Overflow', child: Case2HorizontalOverflow()),
          Divider(),
          CaseSection(title: 'Case 3: Invalid ParentDataWidget', child: Case3InvalidExpanded()),
          Divider(),
          CaseSection(title: 'Case 4: Nested Unbounded Scrollable', child: Case4NestedUnbounded()),
          Divider(),
          CaseSection(title: 'Case 5: Horizontal Unbounded Width', child: Case5HorizontalUnbounded()),
          Divider(),
          CaseSection(title: 'Case 6: Misplaced Positioned', child: Case6MisplacedPositioned()),
          Divider(),
          CaseSection(title: 'Case 7: Inefficient Build', child: Case7InefficientBuild()),
        ],
      ),
    );
  }
}

class CaseSection extends StatelessWidget {
  final String title;
  final Widget child;
  const CaseSection({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 8),
        SizedBox(height: 100, child: child),
      ],
    );
  }
}

class Case1VerticalUnbounded extends StatelessWidget {
  const Case1VerticalUnbounded({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
        ),
      ],
    );
  }
}

class Case2HorizontalOverflow extends StatelessWidget {
  const Case2HorizontalOverflow({super.key});
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.warning),
        Text(
          'This is an excessively long text that will definitely overflow the horizontal boundaries of the screen because it is not wrapped in an Expanded or Flexible widget.',
        ),
      ],
    );
  }
}

class Case3InvalidExpanded extends StatelessWidget {
  const Case3InvalidExpanded({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Expanded(
            child: Container(color: Colors.red, height: 100),
          ),
        ],
      ),
    );
  }
}

class Case4NestedUnbounded extends StatelessWidget {
  const Case4NestedUnbounded({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => Text('Nested $index'),
        ),
      ],
    );
  }
}

class Case5HorizontalUnbounded extends StatelessWidget {
  const Case5HorizontalUnbounded({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ListView(
          scrollDirection: Axis.horizontal,
          children: const [Text('Horizontally scrollable content')],
        ),
      ],
    );
  }
}

class Case6MisplacedPositioned extends StatelessWidget {
  const Case6MisplacedPositioned({super.key});
  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: 10,
      child: Text('I am not inside a Stack!'),
    );
  }
}

class Case7InefficientBuild extends StatefulWidget {
  const Case7InefficientBuild({super.key});
  @override
  State<Case7InefficientBuild> createState() => _Case7InefficientBuildState();
}

class _Case7InefficientBuildState extends State<Case7InefficientBuild> {
  @override
  Widget build(BuildContext context) {
    final heavyList = List.generate(1000, (index) => 'Item $index');
    final processedList = heavyList.map((e) => e.toUpperCase()).toList();

    return ListView(
      children: [
        for (var item in processedList) Text(item),
      ],
    );
  }
}
