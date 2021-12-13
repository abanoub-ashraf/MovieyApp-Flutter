import 'package:flutter/material.dart';

class NavigationListItemWidget extends StatelessWidget {
    final String title;
    final VoidCallback onPressed;

    const NavigationListItemWidget({
        Key? key,
        required this.title,
        required this.onPressed,
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
                child: ListTile(
                    title: Text(
                        title,
                        style: Theme.of(context).textTheme.subtitle1,
                    ),
                ),
            ),
        );
    }
}