import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Optional domain-specific color overrides for a skin.
///
/// Skins can tint event-type and transport-type accent colors to match their
/// palette. When a field is null, [AppColors] defaults are used.
class SkinDomainColors {
  const SkinDomainColors({
    this.flight,
    this.train,
    this.car,
    this.bus,
    this.ferry,
    this.cruise,
    this.subway,
    this.hotel,
    this.restaurant,
    this.activity,
    this.attraction,
    this.rental,
  });

  final Color? flight;
  final Color? train;
  final Color? car;
  final Color? bus;
  final Color? ferry;
  final Color? cruise;
  final Color? subway;
  final Color? hotel;
  final Color? restaurant;
  final Color? activity;
  final Color? attraction;
  final Color? rental;

  /// Get event type color with fallback to [AppColors.getEventTypeColor].
  Color eventTypeColor(String? type) {
    if (type == null) return AppColors.primary;
    final lower = type.toLowerCase();

    // Check skin overrides first
    if (lower.contains('flight') || lower.contains('air')) {
      if (flight != null) return flight!;
    } else if (lower.contains('train') || lower.contains('rail')) {
      if (train != null) return train!;
    } else if (lower.contains('car') || lower.contains('drive') || lower.contains('taxi')) {
      if (car != null) return car!;
    } else if (lower.contains('bus') || lower.contains('coach')) {
      if (bus != null) return bus!;
    } else if (lower.contains('ferry')) {
      if (ferry != null) return ferry!;
    } else if (lower.contains('cruise')) {
      if (cruise != null) return cruise!;
    } else if (lower.contains('subway') || lower.contains('metro')) {
      if (subway != null) return subway!;
    } else if (lower.contains('hotel') || lower.contains('accommodation') || lower.contains('hostel')) {
      if (hotel != null) return hotel!;
    } else if (lower.contains('restaurant') || lower.contains('dining') || lower.contains('food')) {
      if (restaurant != null) return restaurant!;
    } else if (lower.contains('activity') || lower.contains('experience')) {
      if (activity != null) return activity!;
    } else if (lower.contains('attraction') || lower.contains('sightseeing')) {
      if (attraction != null) return attraction!;
    } else if (lower.contains('rental')) {
      if (rental != null) return rental!;
    }

    // Fall back to AppColors
    return AppColors.getEventTypeColor(type);
  }

  /// Get transportation type color with fallback to [AppColors.getTransportationTypeColor].
  Color transportTypeColor(String? type) {
    if (type == null) return AppColors.primary;
    final lower = type.toLowerCase();

    if (lower.contains('flight') && flight != null) return flight!;
    if (lower.contains('train') && train != null) return train!;
    if (lower.contains('car') && car != null) return car!;
    if (lower.contains('bus') && bus != null) return bus!;
    if (lower.contains('ferry') && ferry != null) return ferry!;
    if (lower.contains('cruise') && cruise != null) return cruise!;
    if ((lower.contains('subway') || lower.contains('metro')) && subway != null) return subway!;

    return AppColors.getTransportationTypeColor(type);
  }
}
