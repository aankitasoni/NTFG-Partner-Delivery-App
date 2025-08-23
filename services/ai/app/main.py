from fastapi import FastAPI
from pydantic import BaseModel
from typing import List, Optional

app = FastAPI(title="NTFG AI Service")

class Candidate(BaseModel):
    partner_id: str
    distance_km: float
    eta_min: float
    load: int
    rating: float = 5.0

class DispatchRequest(BaseModel):
    order_id: str
    candidates: List[Candidate]

class Score(BaseModel):
    partner_id: str
    score: float

@app.get("/health")
async def health():
    return {"ok": True, "service": "ai"}

@app.post("/dispatch/score-candidates", response_model=List[Score])
async def score_candidates(req: DispatchRequest):
    scores = []
    for c in req.candidates:
        # Simple heuristic; replace with trained model later
        score = 100.0
        score -= c.distance_km * 5
        score -= c.eta_min * 2
        score -= c.load * 3
        score += (c.rating - 4.5) * 10
        scores.append(Score(partner_id=c.partner_id, score=score))
    scores.sort(key=lambda x: x.score, reverse=True)
    return scores

class ForecastResponse(BaseModel):
    partner_id: str
    next_7d_estimate_cents: int

@app.get("/earnings/forecast", response_model=ForecastResponse)
async def forecast(partnerId: str):
    # placeholder forecast
    base = 50000
    return ForecastResponse(partner_id=partnerId, next_7d_estimate_cents=base)