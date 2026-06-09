from flask import Blueprint

academic_bp = Blueprint(
    "academic",
    __name__,
    url_prefix="/academic"
)


@academic_bp.route("/")
def academic_home():

    return "Academic funcionando"