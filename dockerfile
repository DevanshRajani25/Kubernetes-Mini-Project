# Light weight base image
FROM python:3.9-slim

# Set Env variables to prevent python from writing .pyc files and buffer output
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set working directory inside container
WORKDIR /app

# Copy required files
COPY requirements.txt /app/
COPY app.py /app/
COPY templates /app/templates
COPY static /app/static

# Install python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port on which app runs
EXPOSE 5000

# Run application
CMD ["python", "app.py"]