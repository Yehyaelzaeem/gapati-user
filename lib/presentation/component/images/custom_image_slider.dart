
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/resources/values_manager.dart';
import 'custom_image.dart';

class CustomImageSlider extends StatefulWidget {
  final List<String> _sliders;
  final double _height;
  final double? _width;
  final double? _imageWidth;
  final double _radius;
  final EdgeInsetsGeometry? _margin;

  @override
  _CustomImageSliderState createState() => _CustomImageSliderState();

  const CustomImageSlider({
    required List<String> sliders,
     double height=199,
     double imageWidth=199,
     double width=199,
    EdgeInsetsGeometry? margin,
     double radius=kFormRadius,
  })  : _sliders = sliders, _radius = radius,
        _width = width,
        _imageWidth = imageWidth,
        _margin = margin,
        _height = height;
}

class _CustomImageSliderState extends State<CustomImageSlider> {
  var _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget._margin,
      width: widget._width??double.infinity,
      child: GestureDetector(
        onTap: (){

          // Navigator.pushNamed(context, RouteHelper.image_slider_screen, arguments: ImageSliderScreen(images: widget.sliders,index: _currentPage, ));

        },
        child: (widget._sliders.isNotEmpty && widget._sliders.length < 2)
            ? CustomImage(image: widget._sliders.first, width: widget._imageWidth??deviceWidth,height:  widget._height, fit: BoxFit.cover,radius: widget._radius,)
            : Column(
              children: <Widget>[
                CarouselSlider(
                  items: widget._sliders.map((singleSlider) {return

                    Padding(padding:EdgeInsets.symmetric(horizontal: 8.w) ,
                    child: CustomImage(
                      image: singleSlider,width: deviceWidth,height:  widget._height,fit: BoxFit.cover,radius: widget._radius,),
                    );}).toList(),
                  options: CarouselOptions(
                    viewportFraction: 0.8,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    enlargeCenterPage: false,
                    disableCenter: false,
                    scrollDirection: Axis.horizontal,
                    // to see it like cards
                    initialPage: _currentPage,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,

                    height: widget._height,
                    onPageChanged: (pageNo, reason) {
                      setState(() {
                        _currentPage = pageNo;
                      });
                    },
                  ),
                ),
                verticalSpace(kScreenPaddingNormal.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ...widget._sliders.map((singleString) {
                      var index = widget._sliders.indexOf(singleString);
                      return Container(
                          width: 8.r,
                          height: 8.r,
                          margin: const EdgeInsets.symmetric( horizontal: 4.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == index ? Theme.of(context).primaryColor : Theme.of(context).hintColor,
                          )
                      );
                    }),
                  ],
                )
          ],
        ),
      ),
    );
  }
}
