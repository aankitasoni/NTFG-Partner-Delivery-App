import { Body, Controller, Post } from '@nestjs/common';

@Controller('tracking')
export class TrackingController {
  @Post('heartbeat')
  heartbeat(@Body() body: { lat: number; lng: number; speed?: number; heading?: number }) {
    return { ok: true, received: body };
  }
}