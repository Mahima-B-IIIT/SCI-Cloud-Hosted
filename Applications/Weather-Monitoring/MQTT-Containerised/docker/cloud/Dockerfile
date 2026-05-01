FROM python:3.11-slim

WORKDIR /app

# Direct package installation
RUN pip install --no-cache-dir flask flask-cors paho-mqtt

# Copy only the cloud server code
COPY app/cloud/cloud_server.py .

# Using port 6001 as per your script
EXPOSE 6001

CMD ["python", "cloud_server.py"]