# Use an official Python runtime as a parent image
FROM tensorflow/tensorflow:latest-gpu

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD aarhusstiftstidende /app/aarhusstiftstidende
ADD helper.py /app
ADD test.py /app
ADD models /app/models
ADD out /app/out
ADD images /app/images

RUN apt-get update
RUN apt-get install -y libsm6 libxext6 libgtk2.0-dev python3-pip
RUN pip3 --no-cache-dir install \
    https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-1.10.1-cp35-cp35m-linux_x86_64.whl
RUN pip3 install Image
RUN pip3 install scipy
RUN pip3 install opencv-python