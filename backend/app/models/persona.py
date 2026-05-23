from pydantic import BaseModel

class Persona(BaseModel):
    nombre: str
    apellido: str
    edad: int