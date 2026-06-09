import os

class Config:

    SQLALCHEMY_DATABASE_URI = (
        "postgresql://postgres:tu_password@db:5432/imetesh"
    )

    SQLALCHEMY_TRACK_MODIFICATIONS = False

    SECRET_KEY = os.getenv("SECRET_KEY", "dev_key")