#### The base image in which we develop ####
FROM althack/ros2:galactic-full AS developer
RUN apt update && apt install -y libboost-python1.71-dev libopencv-dev 
WORKDIR /workspace

#### The builder image, additionally contains the source code for compilation ####
FROM developer AS builder
USER ros
RUN mkdir /home/ros/ws && chown ros:ros /home/ros/ws -R
WORKDIR /home/ros/ws
ADD --chown=ros:ros src /home/ros/ws/src
RUN colcon build --event-handler console_direct+ --cmake-args '-DCMAKE_BUILD_TYPE=Release' --packages-up-to composition


#### The final application only copy whats necessary to run ###
FROM althack/ros2:galactic-dev
RUN apt update && apt install -y libboost-python1.71-dev libopencv-dev 
SHELL ["/bin/bash"]
COPY --from=builder --chown=ros:ros /home/ros/ws/install /app
WORKDIR /app
ENTRYPOINT ["/bin/bash", "-c","source setup.bash && ros2 launch composition composition_demo.launch.py"]


