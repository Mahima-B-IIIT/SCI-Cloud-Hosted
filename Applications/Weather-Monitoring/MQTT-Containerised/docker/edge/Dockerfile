FROM python:3.11-slim

WORKDIR /app

RUN pip install --no-cache-dir paho-mqtt

COPY app/edge/ .

# We'll override SCRIPT_NAME in docker-compose for NE and SW
ENV SCRIPT_NAME=ne_edge.py

CMD sh -c "python ${SCRIPT_NAME}"