ARG BUILD_FROM="homeassistant/amd64-base:latest"

FROM ${BUILD_FROM} AS final

ENV LANG C.UTF-8

RUN echo "Install base requirements." \
    && apk add --no-cache --virtual .necessary-mjpeg-streamer libjpeg tinyproxy libgphoto2 \
    && echo "Install mjpg-streamer." \
    && apk add --no-cache --virtual .build-dependencies-mjpgstreamer make cmake build-base linux-headers libjpeg-turbo-dev libgphoto2-dev libjpeg8-dev gcc g++ \
    && wget -qO- https://github.com/jacksonliam/mjpg-streamer/archive/master.tar.gz | tar xz -C /tmp \
    && cd /tmp/mjpg-streamer-master/mjpg-streamer-experimental/ \
    && make --silent \
    && make install --silent \
    && mv www/ /www_mjpg \
        && export LD_LIBRARY_PATH=/mjpg_streamer -o "output_http.so -w ./www_mjpg" -i "input_raspicam.so"
    && rm -rf /tmp/mjpg-streamer-master \
    && apk del --no-cache .build-dependencies-mjpgstreamer \
COPY rootfs/ /
WORKDIR /
