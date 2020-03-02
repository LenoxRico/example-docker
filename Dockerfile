# Specifying our base image
FROM alpine:3.5

# Install Python and Pip
RUN apk add --update py2-pip

# Install Python modules needed by the Python app
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

# Copy the files required for the app to run
COPY app.py /usr/src/app/
COPY templates/index.html /usr/src/app/templates/

# Specify the port number which needs to be exposed
EXPOSE 5000

# Command for running the application
CMD ["python", "/usr/src/app/app.py"]