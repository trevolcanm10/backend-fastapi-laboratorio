from fastapi import APIRouter
from app.services.json_service import leer_json

router = APIRouter()

@router.get("/usuarios")
def obtener_usuarios():
    return leer_json("app/data/usuarios.json")