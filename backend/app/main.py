import os
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from .routers import sales, bom
import logging

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(sales.router)
app.include_router(bom.router, prefix="/api/v1")

@app.on_event("startup")
async def startup_event():
    logger.info("Starting up the application")
    logger.info(f"Database URL: {SQLALCHEMY_DATABASE_URL}")

@app.on_event("shutdown")
async def shutdown_event():
    logger.info("Shutting down the application")

if __name__ == "__main__":
    import uvicorn
    port = int(os.environ.get("PORT", 8080))
    uvicorn.run(app, host="0.0.0.0", port=port)
