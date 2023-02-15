
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_city_project/bloc/ticket_event.dart';
import 'package:new_city_project/bloc/ticket_state.dart';
import 'package:new_city_project/services/ticket_service.dart';

import '../model/ticket_model.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  final TicketService ticketService;

  TicketBloc({required this.ticketService}) : super(const TicketUninitializedState(isLoading: true)){
    on<AllTicketEvent>((event,emit)async{

      try{
        emit(const AllTicketState(isLoading:true, exception:null));
        final tickets = await ticketService.getAllTickets();

        if(tickets is TicketModel){
          log("TICKETS: $tickets");
          emit(AllTicketState(isLoading:false, allTicketsData:tickets, exception:null));
        }
      }catch(e){
        log("Excpetion: $e");
        emit(AllTicketState(isLoading:false, exception:Exception(["Error"]) ));
      }
      

    });
  }
}
