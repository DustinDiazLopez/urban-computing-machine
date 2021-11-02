#!/bin/bash

# if [ -n "${RTMP_DEST_IP+1}" ]; then
#   echo "\$RTMP_DEST_IP is set"
# else
#   RTMP_DEST_IP=159.203.188.180
# fi

RTMP_DEST_IP=159.203.188.180
SHOW_ID=uuid-for-stream

NOW=$(date + "%m%d%Y%H%M%S%N")
RTMP_DEST_KEY="$SHOW_ID-$NOW"
VIDEO_SIZE=1280x720
FRAMERATE=15

echo "IP:  $RTMP_DEST_IP"
echo "KEY: $RTMP_DEST_KEY"
echo "DIM: $VIDEO_SIZE"
echo "FPS: $FRAMERATE"

screen -dmS ffmpeg-stream-cam
screen -S ffmpeg-stream-cam -X stuff 'ffmpeg -f v4l2 -input_format h264 -video_size $VIDEO_SIZE -framerate $FRAMERATE -threads 0 -i /dev/video0 -vcodec copy -an -f flv "rtmp://$RTMP_DEST_IP/show/$RTMP_DEST_KEY"\n'
