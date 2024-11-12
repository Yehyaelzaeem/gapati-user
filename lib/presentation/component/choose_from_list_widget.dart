import '../../src/main_index.dart';

class ChooseFromListItemWidget extends BaseStatelessWidget {
  final List<ChooseItemListModel> items;
  final void Function(ChooseItemListModel item) onChoose;
  final double? radius;
  final double? width;
  final double? height;
   ChooseFromListItemWidget({super.key,this.width, this.height,required this.onChoose,this.radius, required this.items, });

   @override
  Widget build(BuildContext context) {

     String index = items[0].title;

     return StatefulBuilder(builder: (context,setState){
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...items.map((e) => Padding(
              padding: 5.paddingHoriz+10.paddingVert,
              child: InkWell(
                onTap: (){

                  setState(() {
                    index =e.title;
                  });
                  onChoose(e);

                },
                child: Center(
                  child: Container(
                    height:height ,
                    width:width ,
                    decoration: Decorations.kDecorationRadius(
                        color: index==e.title?primaryColor:null,
                        borderColor: index==e.title? Colors.transparent:Colors.grey.shade300,
                        radius:radius?? 20),
                    child: Center(
                      child: Padding(
                        padding: 6.paddingVert+12.paddingHoriz+4.paddingTop,
                        child: Text(
                          e.title,
                         style: TextStyle(
                           fontSize: 17,
                           fontWeight: FontWeight.bold,
                           color: index==e.title?Colors.white:Colors.grey.shade500,
                         ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )),
          ],
        ),
      );
    });
  }
}
class ChooseItemListModel {
  final int id;
  final String title;

  ChooseItemListModel({required this.id, required this.title});
}
