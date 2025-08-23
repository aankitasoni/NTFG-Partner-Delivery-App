import { Injectable } from '@nestjs/common';

@Injectable()
export class OrdersService {
  feed() {
    // stub feed for mobile integration
    return [
      { id: 'o1', pickup: { lat: 12.97, lng: 77.59 }, dropoff: { lat: 12.98, lng: 77.6 }, items: 2 },
      { id: 'o2', pickup: { lat: 12.96, lng: 77.58 }, dropoff: { lat: 12.99, lng: 77.61 }, items: 1 },
    ];
  }
}