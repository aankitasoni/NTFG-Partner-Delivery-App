import { Controller, Get, Query } from '@nestjs/common';
import { EarningsService } from './earnings.service';

@Controller('earnings')
export class EarningsController {
  constructor(private readonly service: EarningsService) {}

  @Get('summary')
  summary(@Query('range') range = 'week') {
    return this.service.summary(range);
  }
}