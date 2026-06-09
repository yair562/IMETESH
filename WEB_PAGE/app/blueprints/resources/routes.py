from flask import Blueprint

resources_bp = Blueprint(
    "resources",
    __name__,
    url_prefix="/resources"
)


@resources_bp.route("/")
def resources_home():

    return "Resources funcionando"