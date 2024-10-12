from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from .routers import sales, bom  # Add this line
import logging

# Configure logging
logging.basicConfig(level=logging.INFO)

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
