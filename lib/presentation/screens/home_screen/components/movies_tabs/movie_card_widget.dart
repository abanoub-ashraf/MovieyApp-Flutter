import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../data/core/api_constants.dart';
import '../../../../../common/extensions/string_extensions.dart';

class MovieCardWidget extends StatelessWidget {
    final int movieId;
    final String title;
    final String posterPath;

    const MovieCardWidget({
        Key? key,
        required this.movieId,
        required this.title,
        required this.posterPath,
    }) : super(
        key: key
    );

    @override
    Widget build(BuildContext context) {
        return GestureDetector(
            onTap: () {},
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    Expanded(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.w),
                            child: CachedNetworkImage(
                                imageUrl: '${ApiConstants.BASE_IMAGE_URL}$posterPath',
                                fit: BoxFit.cover,
                            ),
                        ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: 4.h,
                        ),
                        child: Text(
                            title.intelliTrim(),
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText2,
                        ),
                    )
                ],
            ),
        );
    }
}