from handlers import pages, api
from flask import Flask


def create_app():
    app = Flask(__name__)
    app.register_blueprint(pages.bp)
    app.register_blueprint(api.bp)

    return app
