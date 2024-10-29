// import 'dart:developer';

// import 'package:car_serviceapp2/presentation/home_screen/home_screen.dart';
// import 'package:car_serviceapp2/presentation/services_screen/modal.dart';
// import 'package:car_serviceapp2/presentation/washing_list_out_one_tab_container_screen/Serviceonebyone_Page.dart';
// import 'package:car_serviceapp2/presentation/widgetshimmer/loading3.dart';
// import 'package:car_serviceapp2/viewmodel/commonviewmodel.dart';
// import 'package:car_serviceapp2/viewmodel/sampleviewmodel.dart';
// import 'package:car_serviceapp2/webservice/webservice.dart';
// import 'package:car_serviceapp2/widgets/app_bar/appbar_leading_image.dart';
// import 'package:car_serviceapp2/widgets/app_bar/appbar_subtitle_one.dart';
// import 'package:car_serviceapp2/widgets/app_bar/appbar_trailing_image.dart';
// import 'package:car_serviceapp2/widgets/app_bar/custom_app_bar.dart';
// import 'package:provider/provider.dart';

// import '../cart_screen/cart_screen.dart';
// import '../search_screen/search_screen.dart';
// import '../services_screen/widgets/services_item_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:car_serviceapp2/core/app_export.dart';

// import '../widgetshimmer/loading5.dart';

// // import '../washing_list_out_one_tab_container_screen/washing_list_out_one_tab_container_screen.dart';

// class ServicesScreen extends StatefulWidget {
//   String catname;
//   String catid;

//   ServicesScreen({
//     required this.catid,
//     required this.catname,
//   });

//   @override
//   State<ServicesScreen> createState() => _ServicesScreenState();
// }

// TextEditingController searchcontroller = TextEditingController();

// class _ServicesScreenState extends State<ServicesScreen> {
//   CommonViewModel? vm;

//   // final List _photos = [
//   //   Data(image: "assets/images/img_rectangle_25.png", text: "Washing"), //1
//   //   Data(image: "assets/images/img_rectangle_6.png", text: "Detailing"), //2
//   //   Data(image: "assets/images/img_rectangle_26.png", text: "AC Service"), //3
//   //   Data(image: "assets/images/img_rectangle_8.png", text: "Oil Change"), //4
//   //   Data(image: "assets/images/img_rectangle_25.png", text: "XXXX"), //5
//   //   Data(image: "assets/images/img_rectangle_6.png", text: "XXXXX"), //6

//   //   Data(image: "assets/images/img_rectangle_26.png", text: "XXXX"), //7

//   //   //8
//   // ];

//   // const ServicesScreen({Key? key}) : super(key: key);
//    List<ServiceViewmodel> _searchItems = [];

//     final _formKey = GlobalKey<FormState>();
    
//   @override
//   void initState() {
//     vm = Provider.of<CommonViewModel>(context, listen: false);

//     vm!.getServiceData(widget.catid);
//  _searchItems = vm!.serviceitem;
//     vm!.getSearchServiceData(widget.catid,"");
//     super.initState();
//   }

  
 
//   void _runFilter(String enteredKeyword) {
//     vm = Provider.of<CommonViewModel>(context, listen: false);

//     List<ServiceViewmodel> results = [];
//     vm!.getSearchServiceData(widget.catid,enteredKeyword);
//     if (enteredKeyword.isEmpty) {
//       results = vm!.serviceitem;
//       setState(() {
//         _searchItems = results;
//       });
//     } else {
//       setState(() {
     
//         List<ServiceViewmodel> results = vm!.searchserviceitem
//             .where((item) =>
//                 item.servicename.toLowerCase().contains(enteredKeyword.toLowerCase()))
//             .toList();
//         _searchItems = results;
//       });
  
//     }

//     log("search list length == " + _searchItems.length.toString());
//   }

  

//   @override
//   Widget build(BuildContext context) {
//     vm = Provider.of<CommonViewModel>(context, listen: false);
//     log("catname = " + widget.catname.toString());
//     log("catid  = " + widget.catid.toString());

//     return Scaffold(
//         backgroundColor: appTheme.whiteA700, //not need container
//         appBar: _buildAppBar(context),
//         body: Column(
//           children: [
//             Container(
//                 height: 80,
//                 width: 380,
//                 color: appTheme.whiteA700,
//                 child: Form(
//                     key: _formKey,
//                     child: ListView(
//                       children: [
//                         Container(
//                           alignment: Alignment.center,
//                           padding: EdgeInsets.all(10),
//                           child: Padding(
//                               padding: EdgeInsets.all(10),
//                               child: TextFormField(
//                                 controller: searchcontroller,
//                                 cursorColor: Color(0xFFFFFF3B00),
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                 ),
//                                 decoration: InputDecoration(
//                                   hintText: "Search",
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(25),

//                                     //borderSide: BorderSide.none,
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(25),
//                                     borderSide: BorderSide(
//                                       color: Color(0xFFFFFF3B00),
//                                       width: 1,
//                                     ),
//                                   ),
//                                 ),
//                                 onChanged: (value) {
                                  
//                       _runFilter(value);
//                                 },
//                               )),
//                         ),
//                       ],
//                     )
//                     )
//                     ),
//             Padding(
//               padding: EdgeInsets.only(left: 35, top: 15, right: 35), //24
//               child: Consumer<CommonViewModel>(
//                       builder: (context, service, child) {
//                     return service.serviceload
//                         ? GridView.builder(
//                           gridDelegate:
//                               SliverGridDelegateWithFixedCrossAxisCount(
//                                   mainAxisExtent: 119,
//                                   crossAxisCount: 2,
//                                   mainAxisSpacing: 20,
//                                   crossAxisSpacing: 10),
//                           shrinkWrap: true,
//                           itemCount: 4,
//                           itemBuilder: (context, index) {
//                             return Container(
//                               child: ShimmerWidget5.gridview(
//                                 width: 100,
//                                 height: 100,
//                               ),
//                             );
//                           })
//                         : service.searchserviceload == true
//                             ? GridView.builder(
//                           gridDelegate:
//                               SliverGridDelegateWithFixedCrossAxisCount(
//                                   mainAxisExtent: 119,
//                                   crossAxisCount: 2,
//                                   mainAxisSpacing: 20,
//                                   crossAxisSpacing: 10),
//                           shrinkWrap: true,
//                           itemCount: 4,
//                           itemBuilder: (context, index) {
//                             return Container(
//                               child: ShimmerWidget5.gridview(
//                                 width: 100,
//                                 height: 100,
//                               ),
//                             );
//                           })
//                             : (_searchItems.isEmpty)
//                                 ? Center(
//                                     child: Text("No data"))
//                                 :  GridView.builder(
//                           shrinkWrap: true,
//                           gridDelegate:
//                               SliverGridDelegateWithFixedCrossAxisCount(
//                                   mainAxisExtent: 119, // 119
//                                   crossAxisCount: 2,
//                                   mainAxisSpacing: 20, // 20
//                                   crossAxisSpacing: 10), //20
//                           physics: NeverScrollableScrollPhysics(),
//                           itemCount: _searchItems.length,
                    
//                           itemBuilder: (context, index) {
//                             final service = _searchItems[index];

//                             return InkWell(
//                               onTap: () {
                       
//                                 Navigator.push(context,
//                                     MaterialPageRoute(builder: ((context) {
//                                   return Serviceonebyone_Page(
//                                     sername: _searchItems[index].servicename,
//                                     serviceid:
//                                         _searchItems[index].id.toString(),
//                                     id: _searchItems[index].id.toString(),
//                                     image: '',
//                                     name: '',
//                                     off: '',
//                                     offer: '',
//                                     price: '',
//                                     time: '',
//                                     warranty: '',
//                                     // id:snapshot.data![index].
//                                   );
//                                 })));
//                               }, //column
//                               child: Container(
//                                 child: Center(
//                                     child: Text(
//                                   service.servicename,
//                                   // _photos[index].text,
//                                   style: CustomTextStyles
//                                       .titleSmallWhiteA700SemiBold,
//                                   // TextStyle(color: Colors.white),
//                                 )),
//                                 height: 118,
//                                 width: 150,
//                                 decoration: BoxDecoration(

//                                     //  color: Colors.amber,
//                                     borderRadius: BorderRadius.circular(
//                                       30,
//                                     ),
//                                     image: DecorationImage(
//                                       image: NetworkImage(
//                                           // "assets/images/img_rectangle_25_152x270.png"
//                                           //   _photos[index].image

//                                           Webservice().imageurl +
//                                               service.image),
//                                       // fit: BoxFit.cover
//                                     )),
//                               ),
//                             );
//                           });})
              
              
             
      
//             ),
//           ],
//         ),
//         );
//   }

//   /// Section Widget
//   PreferredSizeWidget _buildAppBar(BuildContext context) {
//     return AppBar(
//       backgroundColor: appTheme.whiteA700,
//       elevation: 0,
//       toolbarHeight: 80,
//       leadingWidth: 57,
//       leading: IconButton(
//         icon: const Icon(Icons.arrow_back_ios_new,
//             // color: Color(0XAFFF3B00),
//             color: Color(0xFFFFFF3B00)),
//         onPressed: () {
//           Navigator.pop(context);
//         },
//       ),
//       title: AppbarSubtitleOne(
//           text: widget.catname,
//           //"Value Added Services",
//           margin: EdgeInsets.only(left: 11)),
//       // actions: [
//       //   Padding(
//       //     padding: EdgeInsets.symmetric(horizontal: 16),
//       //     child: IconButton(
//       //       icon: Icon(
//       //         Icons.search,
//       //         color: Color(0xFFFFFF3B00),
//       //         size: 30,
//       //       ),
//       //       onPressed: () {
//       //         Navigator.push(
//       //           context,
//       //           MaterialPageRoute(builder: (context) => SearchScreen()),
//       //         );
//       //       },
//       //     ),
//       //   ),
//       // ]
//     );
//   }

//   /// Navigates to the washingListOutOneTabContainerScreen when the action is triggered.
//   onTapImgWashing(BuildContext context) {
//     Navigator.pushNamed(context, AppRoutes.washingListOutOneTabContainerScreen);
//   }

//   /// Navigates back to the previous screen.

//   onTapArrowLeft(BuildContext context) {
//     Navigator.pop(context);
//   }
// }
