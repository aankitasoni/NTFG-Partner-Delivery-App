import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Partner } from './partner.entity';

@Injectable()
export class PartnerService {
  constructor(@InjectRepository(Partner) private repo: Repository<Partner>) {}

  async register(dto: { phone: string; name?: string; email?: string }) {
    let existing = await this.repo.findOne({ where: { phone: dto.phone } });
    if (existing) return existing;
    const partner = this.repo.create({ phone: dto.phone, name: dto.name, email: dto.email });
    return this.repo.save(partner);
  }
}