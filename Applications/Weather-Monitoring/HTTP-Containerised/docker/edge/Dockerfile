FROM python:3.11-slim

WORKDIR /app

RUN pip install --no-cache-dir flask requests

# Copy the entire edge folder from the app directory
COPY app/edge/ .

# Default script (can be overridden in docker-compose)
ENV SCRIPT_NAME=ne_edge.py

# Using 'sh -c' to allow the variable expansion
CMD sh -c "python ${SCRIPT_NAME}"