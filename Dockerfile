# The base image
FROM gcc:4.9 AS builder

# Install dependencies
RUN apt update && apt install -y cmake
WORKDIR /usr/src/app

# Build the application
ADD src src
ADD CMakeLists.txt CMakeLists.txt
RUN mkdir build && cd build && cmake .. && make -j4 && make install

# Create runtime image containing only the binaries
FROM debian AS runtime
COPY --from=builder /usr/local/bin/app /usr/local/bin/app

# Install python for more convienient entry scripts
RUN apt update && apt install -y python3
ADD scripts scripts

# Define entrypoint
ENTRYPOINT ["/usr/bin/python3","scripts/entrypoint.py"]
