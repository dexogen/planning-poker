FROM python:3.12-slim

ENV GUNICORN_VERSION=23.0.0

WORKDIR /app

COPY requirements.txt ./
RUN pip install gunicorn==$GUNICORN_VERSION && \
    pip install --no-cache-dir -r requirements.txt && \
    rm -rf /root/.cache/pip

COPY src/ /app/

ENTRYPOINT ["gunicorn"]
