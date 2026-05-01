FROM python:3.11-slim

WORKDIR /app

# Install dependencies directly
RUN pip install --no-cache-dir flask flask-cors requests

# Copy the cloud source code from the app directory
COPY app/cloud/cloud_server.py .

EXPOSE 8000

CMD ["python", "cloud_server.py"]