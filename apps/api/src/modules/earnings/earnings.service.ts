import { Injectable } from '@nestjs/common';

@Injectable()
export class EarningsService {
  summary(range: string) {
    return {
      range,
      total_cents: 123450,
      trips: 42,
      bonuses_cents: 15000,
    };
  }
}