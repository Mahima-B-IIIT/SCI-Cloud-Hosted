FROM python:3.11-slim

WORKDIR /app

RUN pip install --no-cache-dir requests

# Copy all sensor scripts
COPY app/sensors/ .

ENV SENSOR_FILE=east.py

CMD sh -c "python ${SENSOR_FILE}"