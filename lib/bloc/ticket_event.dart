import 'package:flutter/material.dart';

@immutable
abstract class TicketEvent {
  const TicketEvent();
}

class AllTicketEvent extends TicketEvent {
  const AllTicketEvent();
}
