import 'package:flutter/material.dart';
import 'package:pinterestapp/model/pinterestmodel.dart';

class Home extends StatelessWidget {
   Home({super.key});
  final List<ListItem> items = List.generate(
    200,
        (index) => ListItem(
      title: 'عنوان العنصر رقم ${index + 1}',  // عنوان العنصر
      imageUrl: 'https://picsum.photos/200/300?random=$index',  // صورة عشوائية مختلفة
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(children: [
                  Text("Welcome to Pinterest",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                  Spacer(),
                  ElevatedButton(onPressed: (){},
                      style: ButtonStyle(shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, // تحديد الحواف المدورة
          ),),
        ), child: Text("NEXT"))

            ]

                ),
                Align(alignment: Alignment.bottomLeft,
                    child: Text("Pick 5 Or more topics",style: TextStyle(fontSize: 24,),)),


                // GridView مع ShrinkWrap لتحديد الحجم
                GridView.count(
                  shrinkWrap: true, // لتحديد الحجم المناسب للمحتوى
                  crossAxisCount: 3, // ثلاثة أعمدة
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  physics: NeverScrollableScrollPhysics(), // منع التمرير داخل GridView
                  children: List.generate(items.length, (index) {
                    final item = items[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [

                      // الصورة الخلفية
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: NetworkImage(item.imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // النص فوق الصورة
                          Container(
                            alignment: Alignment.bottomLeft,
                            color: Colors.black.withOpacity(0), // شفافية
                            child: Text(item.title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
