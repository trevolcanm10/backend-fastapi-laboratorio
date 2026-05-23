from pydantic import BaseModel

class Usuario(BaseModel):
    email: str
    password: str