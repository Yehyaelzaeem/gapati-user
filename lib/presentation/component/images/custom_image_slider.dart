
import 'package:base_app/core/extensions/num_extensions.dart';
import 'package:base_app/core/res/resources.dart';
import 'package:base_app/presentation/component/component.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomImageSlider extends StatefulWidget {
  final List<String> _sliders;
  final double _height;
  final double _radius;

  @override
  _CustomImageSliderState createState() => _CustomImageSliderState();

  const CustomImageSlider({
    required List<String> sliders,
     double height=199,
     double radius=kFormRadius,
  })  : _sliders = sliders, _radius = radius,
        _height = height;
}

class _CustomImageSliderState extends State<CustomImageSlider> {
  var _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GestureDetector(
        onTap: (){

          // Navigator.pushNamed(context, RouteHelper.image_slider_screen, arguments: ImageSliderScreen(images: widget.sliders,index: _currentPage, ));

        },
        child: (widget._sliders.isNotEmpty && widget._sliders.length < 2)
            ? CustomImage(imageUrl: widget._sliders.first, width: deviceWidth,height:  widget._height, fit: BoxFit.cover,canOpenImage: true,radius: widget._radius,)
            : Column(
              children: <Widget>[
                CarouselSlider(
                  items: widget._sliders.map((singleSlider) {return CustomImage(imageUrl: singleSlider,width: deviceWidth,height:  widget._height,fit: BoxFit.cover,canOpenImage: true,radius: widget._radius,);}).toList(),
                  options: CarouselOptions(
                    viewportFraction: 1,
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
                VerticalSpace(kScreenPaddingNormal.h),

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
