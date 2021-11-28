# The base image
FROM python:3 as builder
WORKDIR /workspace
#Installing the application
ADD src src

# Define entrypoint
ENTRYPOINT ["/usr/bin/python3","src/script.py"]
