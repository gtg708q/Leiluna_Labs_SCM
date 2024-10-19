import os
from fastapi import FastAPI, Depends, Request
from fastapi.middleware.cors import CORSMiddleware
import logging
from fastapi.responses import JSONResponse

# Import all models
from backend.app.models import Base, import_log
from backend.app.database import engine, get_db

# Import routers
from backend.app.routers import imports_router, sales_router, bom_router, purchase_orders_router, finished_goods_router

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# Create tables
Base.metadata.create_all(bind=engine)

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000"],  # Add your frontend URL
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(sales_router)
app.include_router(bom_router, prefix="/api/v1")
app.include_router(purchase_orders_router)
app.include_router(finished_goods_router, prefix="/api/v1", tags=["finished_goods"])
app.include_router(imports_router, prefix="/api/v1/imports", tags=["imports"])

@app.on_event("startup")
async def startup_event():
    logger.info("Starting up the application")
    logger.info("Registered routes:")
    for route in app.routes:
        logger.info(f"{route.methods} {route.path}")
    db = next(get_db())
    logger.info(f"Database connection established: {db.bind.url}")

@app.on_event("shutdown")
async def shutdown_event():
    logger.info("Shutting down the application")

@app.exception_handler(Exception)
async def global_exception_handler(request: Request, exc: Exception):
    logger.error(f"Unhandled exception: {str(exc)}")
    return JSONResponse(
        status_code=500,
        content={"message": "An unexpected error occurred."},
    )

# Add this near the end of the file, after all other route includes

@app.api_route("/{path_name:path}", methods=["GET", "POST", "PUT", "DELETE"])
async def catch_all(request: Request, path_name: str):
    logger.warning(f"Attempted to access unhandled route: {request.method} {path_name}")
    return JSONResponse(status_code=404, content={"detail": "Route not found"})

if __name__ == "__main__":
    import uvicorn
    port = int(os.environ.get("PORT", 8080))
    uvicorn.run("app.main:app", host="0.0.0.0", port=port, reload=True)
