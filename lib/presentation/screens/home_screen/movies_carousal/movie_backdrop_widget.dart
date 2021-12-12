import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/core/api_constants.dart';
import '../../../blocs/movie_backdrop_bloc/movie_backdrop_bloc.dart';

class MovieBackdropWidget extends StatelessWidget {
    const MovieBackdropWidget({ Key? key }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 0.95,
            child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(40.w),
                ),
                ///
                /// this stack will have the image in the back and the blur on top of it
                ///
                child: Stack(
                    fit: StackFit.expand,
                    children: [
                        FractionallySizedBox(
                            heightFactor: 1,
                            widthFactor: 1,
                            ///
                            /// - this state will change when the page of the page view is changes
                            ///   from inside the page view widget
                            /// 
                            /// - and also once the carousal loads the movies cause we add the
                            ///   drop changed event while emitting the carousal loaded state
                            ///
                            child: BlocBuilder<MovieBackdropBloc, MovieBackdropState>(
                                builder: (context, state) {
                                    if (state is MovieBackdropChangedState) {
                                        return CachedNetworkImage(
                                            imageUrl: '${ApiConstants.BASE_IMAGE_URL}${state.movie.backdropPath}',
                                            fit: BoxFit.fitHeight,
                                        );
                                    }
                                    return const SizedBox.shrink();
                                },
                            ),
                        ),
                        BackdropFilter(
                            filter: ImageFilter.blur(
                                sigmaX: 5, 
                                sigmaY: 5,
                            ),
                            child: Container(
                                width: ScreenUtil().screenWidth,
                                height: 1,
                                color: Colors.transparent,
                            ),
                        ),
                    ],
                ),
            ),
        );
    }
}