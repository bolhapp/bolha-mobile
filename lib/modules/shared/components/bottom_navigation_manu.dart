import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key, 
    required this.isActive,
    required this.handleClick,
    required this.path,
    required this.icon,
  });

  final Function handleClick; 
  final bool isActive; 
  final String path; 
  final IconData icon; 

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => handleClick(path),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: isActive ? Theme.of(context).colorScheme.primaryFixed : null,
            borderRadius: BorderRadius.all(Radius.circular(50)) 
          ),
          child: Icon(
            icon,
            size: 30,
            color: isActive ? Theme.of(context).colorScheme.onPrimaryFixedVariant : Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ) 
      
    );
  }
}

class BottomNavigationMenu extends StatefulWidget {
  const BottomNavigationMenu({super.key, required this.currentPath});

  final String currentPath;

  @override
  State<BottomNavigationMenu> createState() => BottomNavigationMenuState();
}

class BottomNavigationMenuState extends State<BottomNavigationMenu> {
  late String currentPath = widget.currentPath;

  void handleClick(String path) {
    context.push(path);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: BottomButton(
                path: "/notifications",
                isActive: currentPath == "/notifications",
                handleClick: handleClick,
                icon: Icons.newspaper_rounded,
              ),
          ),
          Expanded(
              flex: 1,
              child: BottomButton(
                path: "/search",
                isActive: currentPath == "/search",
                handleClick: handleClick,
                icon: Icons.search,
              ),
          ),
          Expanded(
              flex: 1,
              child: BottomButton(
                path: "/create_activity",
                isActive: currentPath == "/create_activity",
                handleClick: handleClick,
                icon: Icons.add,
              ),
          ),
          Expanded(
              flex: 1,
              child: BottomButton(
                 path: "/activities",
                isActive: currentPath == "/activities",
                handleClick: handleClick,
                icon: Icons.people_sharp,
              ),
          ),
        ],
      ),
    );
  }
}
