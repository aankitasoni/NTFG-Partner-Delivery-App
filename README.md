# NTFG Partner Delivery App Monorepo

This monorepo contains:
- apps/api (NestJS REST + WebSocket)
- apps/mobile (Flutter app for delivery partners)
- services/ai (FastAPI microservice for dispatch scoring & earnings forecast)
- infra (Docker Compose: Postgres + PostGIS, Redis)
- packages/common (shared schemas & utilities)

## Quick start

1) Prerequisites
- Node.js 20+, pnpm or npm
- Python 3.11+
- Docker Desktop
- Flutter 3.22+

2) Start infra
```bash
# Windows PowerShell
# Start Postgres(PostGIS) and Redis
# See infra/docker-compose.yml
```

3) Backend API (NestJS)
```bash
# From apps/api
# pnpm install
# pnpm start:dev
```

4) AI service (FastAPI)
```bash
# From services/ai
# python -m venv .venv
# .venv\\Scripts\\activate
# pip install -r requirements.txt
# uvicorn app.main:app --reload --port 8081
```

5) Mobile (Flutter)
```bash
# From apps/mobile
# flutter pub get
# flutter run
```

## Environment
Create `.env` files as per each service's example.

## Modules (Phase 1)
- Auth (OTP), Partner profile, KYC, Availability
- Orders feed, Accept/Reject, Active order, Tracking
- Earnings summary, Trips
- WebSocket for offers & chat (MVP)

## Notes
- DB: PostgreSQL + PostGIS
- Cache/Queue: Redis (ready for BullMQ and Socket presence)
- Mapping: Google Maps on mobile