# Use the official Python 3.10 slim image
FROM python:3.10-slim

# Set timezone environment variable (can be overridden)
ENV TZ=UTC
ENV PYTHONUNBUFFERED=1

# Install system dependencies, configure timezone, and clean up
RUN apt-get update && apt-get install -y --no-install-recommends \
    tzdata \
    gcc \
    python3-dev \
    build-essential \
  && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
  && echo $TZ > /etc/timezone \
  && rm -rf /var/lib/apt/lists/*

# Set the working directory to /app
WORKDIR /app

# Upgrade pip to the latest version and install dependencies in one layer
COPY requirements.txt .
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Copy font folder
COPY ./fonts /config/fonts

# Copy all necessary Python scripts
COPY . .

# Default command to run the application
CMD ["python3", "run_status.py"]
