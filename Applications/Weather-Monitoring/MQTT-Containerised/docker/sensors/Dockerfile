FROM python:3.11-slim

WORKDIR /app

RUN pip install --no-cache-dir paho-mqtt

COPY app/sensors/ .

# We'll override SENSOR_FILE for each direction
ENV SENSOR_FILE=east.py

CMD sh -c "python ${SENSOR_FILE}"