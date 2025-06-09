
import 'package:flutter/widgets.dart';

class PlanningPage extends StatefulWidget {
  static const routeName = "/planning";
  const PlanningPage({super.key});

  @override
  State<PlanningPage> createState() => _PlanningPageState();
}

class _PlanningPageState extends State<PlanningPage> {
  final TextEditingController _chatController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context){
    return Stack(
      children: [
        Container(

        )
      ],
    );
  }
}