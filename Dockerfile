# Use an official Python runtime as a parent image
FROM python:3.4.8-wheezy


# Define environment variable
ENV NAME World


# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD requirements.txt /app/requirements.txt

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt
RUN cat /etc/*release
RUN apt-get install -y curl 

RUN curl -sL https://deb.nodesource.com/setup_6.x -o nodesource_setup.sh
RUN chmod +x nodesource_setup.sh && ./nodesource_setup.sh
RUN apt-get install nodejs -y

# Make port 80 available to the world outside this container
EXPOSE 80


# Run app.py when the container launches
CMD ["python", "/app.py"]
