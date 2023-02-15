import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_city_project/bloc/ticket_bloc.dart';
import 'package:new_city_project/services/ticket_service.dart';
import 'package:new_city_project/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => TicketService()
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TicketBloc(ticketService: RepositoryProvider.of<TicketService>(context))
          ),
          
        ],
        child: 
     MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
    
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
     ),),
    );
  }
}
