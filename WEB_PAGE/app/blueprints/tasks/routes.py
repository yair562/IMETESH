from flask import Blueprint

tasks_bp = Blueprint(
    "tasks",
    __name__,
    url_prefix="/tasks"
)


@tasks_bp.route("/")
def tasks_home():

    return "Tasks funcionando"