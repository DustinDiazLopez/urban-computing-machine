line="$(screen -ls | grep ffmpeg-stream-cam)"
pid="$(echo $line | awk '{print substr($0, 0, index($0, "."))}')"
echo "stopping stream..."
screen -XS $pid quit
echo "stopped stream."