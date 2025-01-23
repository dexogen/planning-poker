FROM python:3.12-slim AS base

ENV GUNICORN_VERSION=23.0.0
ENV PYTEST_VERSION=8.3.3

WORKDIR /app

COPY requirements.txt ./
RUN pip install gunicorn==$GUNICORN_VERSION && \
    pip install --no-cache-dir -r requirements.txt && \
    rm -rf /root/.cache/pip

COPY src/ ./

FROM base AS app

ENV GUNICORN_BIND=0.0.0.0:8000
ENV GUNICORN_WORKERS=3
ENV GUNICORN_TIMEOUT=120

EXPOSE 8000

CMD gunicorn --bind ${GUNICORN_BIND} --workers ${GUNICORN_WORKERS} --timeout ${GUNICORN_TIMEOUT} wsgi:app

FROM base AS test

RUN pip install pytest==$PYTEST_VERSION && \
    rm -rf /root/.cache/pip

COPY ./tests ./tests

CMD ["pytest", "tests/"]