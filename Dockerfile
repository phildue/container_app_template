# The base image
FROM python:3 as builder
WORKDIR /workspace
#Installing the application
ADD scripts scripts
ADD src src
# Compile if necessary

# Define entrypoint
ENV MODE "live"
ENTRYPOINT ["/usr/bin/python3","scripts/entrypoint.py"]
