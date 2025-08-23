import { Controller, Get, Post, Param } from '@nestjs/common';
import { OrdersService } from './orders.service';

@Controller('orders')
export class OrdersController {
  constructor(private readonly service: OrdersService) {}

  @Get('feed')
  feed() {
    return this.service.feed();
  }

  @Post(':id/accept')
  accept(@Param('id') id: string) {
    return { id, status: 'accepted' };
  }

  @Post(':id/reject')
  reject(@Param('id') id: string) {
    return { id, status: 'rejected' };
  }
}