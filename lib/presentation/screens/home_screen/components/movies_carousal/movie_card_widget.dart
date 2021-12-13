import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../data/core/api_constants.dart';

class MovieCardWidget extends StatelessWidget {
    final int movieId;
    final String posterPath;

    const MovieCardWidget({ 
        Key? key,
        required this.movieId,
        required this.posterPath
    }): super(
        key: key
    );

    @override
    Widget build(BuildContext context) {
        return Material(
            elevation: 32,
            borderRadius: BorderRadius.circular(16.w),
            child: GestureDetector(
                onTap: () {},
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.w),
                    ///
                    /// this widget is used for caching images after they are downloaded
                    /// from the internet
                    ///
                    child: CachedNetworkImage(
                        imageUrl: '${ApiConstants.BASE_IMAGE_URL}$posterPath',
                        fit: BoxFit.cover,
                    )
                ),
            ),
        );
    }
}