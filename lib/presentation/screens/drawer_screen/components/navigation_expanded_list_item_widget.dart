import 'package:flutter/material.dart';
import 'package:moviey_app/presentation/screens/drawer_screen/components/navigation_sub_list_item_widget.dart';

class NavigationExpandedListItemWidget extends StatelessWidget {
    final String title;
    final VoidCallback onPressed;
    final List<String> children;

    const NavigationExpandedListItemWidget({
        Key? key,
        required this.title,
        required this.onPressed,
        required this.children,
    }) : super(
        key: key
    );

    @override
    Widget build(BuildContext context) {
        return GestureDetector(
            onTap: onPressed,
            child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).primaryColor.withOpacity(0.7),
                            blurRadius: 2,
                        ),
                    ],
                ),
                child: ExpansionTile(
                    title: Text(
                        title,
                        style: Theme.of(context).textTheme.subtitle1,
                    ),
                    children: [
                        for (int i = 0; i < children.length; i++)
                            NavigationSubListItemWidget(
                                title: children[i], 
                                onPressed: () {}
                            ),
                    ],
                ),
            ),
        );
    }
}