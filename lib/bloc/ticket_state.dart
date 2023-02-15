import 'package:flutter/material.dart';
import 'package:new_city_project/model/ticket_model.dart';

@immutable
abstract class TicketState {
  final bool isLoading;

  const TicketState({required this.isLoading});
}

class TicketUninitializedState extends TicketState {
  const TicketUninitializedState({required bool isLoading}) : super(isLoading: isLoading);
}

class AllTicketState extends TicketState {
  final Exception? exception;
  final TicketModel? allTicketsData;
  const AllTicketState({required bool isLoading, this.exception, this.allTicketsData}) : super(isLoading: isLoading);
}
