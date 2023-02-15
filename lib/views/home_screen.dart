import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_city_project/bloc/ticket_bloc.dart';
import 'package:new_city_project/bloc/ticket_event.dart';
import 'package:new_city_project/bloc/ticket_state.dart';
import 'package:new_city_project/utils/res/app_colors.dart';
import 'package:new_city_project/utils/utilities.dart';
import 'package:new_city_project/views/chart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ValueNotifier<bool> changeVal;
  int currentIndex = 0;

  @override
  void initState(){
    super.initState();
    changeVal = ValueNotifier<bool>(false);
    loadApi(context);

  }

 loadApi(BuildContext context) async {
    BlocProvider.of<TicketBloc>(context)
        .add(const AllTicketEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Home"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
          ),
        ),
      ),
      body:Padding(
        padding: const EdgeInsets.all(15),
        child: Column(children:[
           Row(
              children: [
                const Text(
                  "Ticket Details",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                ValueListenableBuilder(valueListenable: changeVal, builder: (context,value,_){
                  return  SizedBox(
                  width: 120,
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: (){
                            changeVal.value = !changeVal.value;
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: changeVal.value? AppColors.light:AppColors.blue,
                              border: Border.all(),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                            ),
                            padding: const EdgeInsets.all(4),
                            child: const Icon(Icons.list),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                           onTap: (){
                            changeVal.value = !changeVal.value;
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: !changeVal.value? AppColors.light:AppColors.blue,

                              border: Border.all(),
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            padding: const EdgeInsets.all(4),
                            child: const Icon(Icons.line_axis),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
                })
               
              ],
            ),
            SizedBox(height: 15),
            Expanded(
              child: BlocConsumer<TicketBloc,TicketState>(builder: ((context, state) {
                if(state is AllTicketState){
                  log("DATA: ${state.allTicketsData?.data.dist}");
List<String>? keys = [];
                  if(state.allTicketsData?.data.dist != null){
                keys    = state.allTicketsData?.data.dist.toJson().keys.toList();
                  }
                  return 
                  
                  state.isLoading?Center(child: const CircularProgressIndicator()): Column(
                    
                    children: [

                      state.allTicketsData == null || state.allTicketsData?.data == null ? Text("NO data"):
                      
                       Container(
                        width: Utilities.screenWidth(context),
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColors.blue,

                          borderRadius: BorderRadius.circular(10)
                        ),
                         child: 
                         
                      state.allTicketsData?.data.dist == null? Text("NO data"):  Row(
    
                    children:keys?.length == 0? []:
                    keys!.map<Widget>((item) => Expanded(child: InkWell(
                      onTap: (){
                        currentIndex = keys?.indexOf(item) ?? 0;
                        setState(() {
                          
                        });
                      },
                      child: Container(
                        height: 45,
                       decoration: BoxDecoration(
                            color: keys?.indexOf(item) == currentIndex?  AppColors.light:Colors.transparent,
                    
                            borderRadius: BorderRadius.circular(10)
                          ),
                        child: Center(child: Text("$item", textAlign: TextAlign.center,))),
                    ))).toList()
                        
                         ),
                       ),

ValueListenableBuilder(valueListenable: changeVal, builder: (context,value,_){
  return Expanded(
                         child:

                         changeVal.value? Chart(
                          keys: keys ?? [],
                          data: state.allTicketsData!,
                         ):
                         
                          Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: GridView.builder(
                            shrinkWrap: true,
                                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                       crossAxisCount: 2,
                                       childAspectRatio: 3 / 2,
                                       crossAxisSpacing: 20,
                                       mainAxisSpacing: 20),
                                   itemCount: currentIndex ==0?
                       
                                   
                                    state.allTicketsData?.data.dist.day.length: currentIndex ==1? 
                                    state.allTicketsData?.data.dist.week.length: currentIndex ==2? state.allTicketsData?.data.dist.month.length: state.allTicketsData?.data.dist.year.length,
                                   itemBuilder: (BuildContext ctx, index) {
                                     return Container(
                                       alignment: Alignment.center,
                                       decoration: BoxDecoration(
                                           color: Colors.amber,
                                           borderRadius: BorderRadius.circular(15)),
                                       child: Column(
                                         mainAxisAlignment: MainAxisAlignment.center,
                                         children: currentIndex ==0? [
                       
                       
                                           Text(state.allTicketsData!.data.dist.day[index].label),
                                           Text(state.allTicketsData!.data.dist.day[index].value),
                                         ]:
                                        currentIndex ==1?[
                       
                       
                                           Text(state.allTicketsData!.data.dist.week[index].label),
                                           Text(state.allTicketsData!.data.dist.week[index].value),
                                         ]: currentIndex ==2? [
                       
                       
                                           Text(state.allTicketsData!.data.dist.month[index].label),
                                           Text(state.allTicketsData!.data.dist.month[index].value),
                                         ]:[
                       
                       
                                           Text(state.allTicketsData!.data.dist.year[index].label),
                                           Text(state.allTicketsData!.data.dist.year[index].value),
                                         ],
                                       ),
                                     );
                                   }),
                         ),
                       );
})
                       


            
                    ],
                  );
                }
                return Text("NO data");
                
              }), listener: ((context, state) {
                
              })),
            )
        ],
        ),
      ),
      
      
      
    );
  }
}
