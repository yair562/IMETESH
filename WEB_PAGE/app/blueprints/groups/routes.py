from flask import Blueprint

groups_bp = Blueprint(
    "groups",
    __name__,
    url_prefix="/groups"
)


@groups_bp.route("/")
def groups_home():

    return "Groups funcionando"