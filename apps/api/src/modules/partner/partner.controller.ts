import { Body, Controller, Get, Post } from '@nestjs/common';
import { PartnerService } from './partner.service';

class RegisterDto { phone!: string; name?: string; email?: string; }

@Controller('partner')
export class PartnerController {
  constructor(private readonly service: PartnerService) {}

  @Post('register')
  async register(@Body() dto: RegisterDto) {
    return this.service.register(dto);
  }

  @Get('me')
  async me() {
    // stub until auth is added
    return { id: 'demo', name: 'Demo Partner' };
  }
}