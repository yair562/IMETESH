from flask import Flask
from app.extensions import db

def create_app():

    app = Flask(__name__)

    app.config.from_object("app.config.Config")

    db.init_app(app)

    from app.blueprints.auth.routes import auth_bp
    from app.blueprints.academic.routes import academic_bp
    from app.blueprints.groups.routes import groups_bp
    from app.blueprints.resources.routes import resources_bp
    from app.blueprints.tasks.routes import tasks_bp

    app.register_blueprint(auth_bp)
    app.register_blueprint(academic_bp)
    app.register_blueprint(groups_bp)
    app.register_blueprint(resources_bp)
    app.register_blueprint(tasks_bp)

    return app