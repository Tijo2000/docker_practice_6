FROM ubuntu:latest

RUN  apt-get update -y
RUN  apt-get install python3 -y \
     && apt-get install python3-pip -y

RUN pip install opencv-python
RUN apt-get install libgl1
RUN pip install tensorflow 2.8.0


WORKDIR /usr/app/src

COPY inference.py ./
COPY label_map.pbtxt ./
COPY saved_model_dir ./
COPY object_detection ./

CMD [ "python3", "./inference.py" ]