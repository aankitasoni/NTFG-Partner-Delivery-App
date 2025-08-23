import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { TypeOrmModule } from 'typeorm';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PartnerModule } from './partner/partner.module';
import { OrdersModule } from './orders/orders.module';
import { TrackingModule } from './tracking/tracking.module';
import { EarningsModule } from './earnings/earnings.module';

@Module({
  imports: [
    ConfigModule.forRoot({ isGlobal: true }),
    TypeOrmModule.forRoot({
      type: 'postgres',
      url: process.env.DATABASE_URL,
      autoLoadEntities: true,
      synchronize: false,
    }),
    PartnerModule,
    OrdersModule,
    TrackingModule,
    EarningsModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}