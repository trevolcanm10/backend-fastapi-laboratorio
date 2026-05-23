from fastapi import APIRouter
from app.services.json_service import leer_json

router = APIRouter()

@router.get("/personas")
def obtener_personas():
    return leer_json("app/data/personas.json")