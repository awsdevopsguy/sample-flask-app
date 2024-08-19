# Use the official Python image from the Docker Hub
FROM python:3

# Set the working directory inside the container
WORKDIR /app

# Copy the application code to the /app directory in the container
COPY . /app

# Install dependencies listed in requirements.txt
# Upgrade pip to avoid issues with older versions
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Expose port 5000 to allow communication to/from the container
EXPOSE 5000

# Define the command to run the application
CMD ["python", "app.py"]
