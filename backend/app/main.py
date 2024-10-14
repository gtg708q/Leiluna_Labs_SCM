import os
from fastapi import FastAPI, Depends
from fastapi.middleware.cors import CORSMiddleware
import logging

# Import all models
from app.models import Base
from app.database import engine, get_db

# Import routers
from app.routers import sales, bom as bom_router, purchase_orders

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# Create tables
Base.metadata.create_all(bind=engine)

app = FastAPI()

# Configure CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000"],  # Add your frontend URL
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(sales.router)
app.include_router(bom_router.router, prefix="/api/v1")
app.include_router(purchase_orders.router)

@app.on_event("startup")
async def startup_event():
    logger.info("Starting up the application")
    db = next(get_db())
    logger.info(f"Database connection established: {db.bind.url}")

@app.on_event("shutdown")
async def shutdown_event():
    logger.info("Shutting down the application")

if __name__ == "__main__":
    import uvicorn
    port = int(os.environ.get("PORT", 8080))
    uvicorn.run("app.main:app", host="0.0.0.0", port=port, reload=True)
