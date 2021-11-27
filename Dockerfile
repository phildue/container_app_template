# The base image
FROM gcc:4.9 AS builder
RUN apt update && apt install -y cmake python3
WORKDIR /usr/src/app
#Installing the application
ADD scripts scripts
ADD src src
ADD CMakeLists.txt CMakeLists.txt
RUN mkdir build && cd build && cmake .. && make -j4 && make install


# Define entrypoint
ENV MODE "live"
ENTRYPOINT ["/usr/bin/python3","scripts/entrypoint.py"]
