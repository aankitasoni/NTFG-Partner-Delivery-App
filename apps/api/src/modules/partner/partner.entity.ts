import { Column, CreateDateColumn, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity('partner')
export class Partner {
  @PrimaryGeneratedColumn('uuid')
  id!: string;

  @Column({ unique: true })
  phone!: string;

  @Column({ nullable: true })
  email?: string;

  @Column({ nullable: true })
  name?: string;

  @Column({ default: 'pending' })
  status!: 'pending' | 'active' | 'suspended';

  @Column({ default: false })
  online!: boolean;

  @Column({ type: 'numeric', precision: 3, scale: 2, default: 5.0 })
  rating!: number;

  @CreateDateColumn()
  created_at!: Date;
}