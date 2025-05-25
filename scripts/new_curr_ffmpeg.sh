#!/bin/sh
#FPS=60;
#SCALE='1980:1080';
FPS=30;
SCALE='1280:720';
SPEED=10;
STTIME=$(ffprobe -v quiet -select_streams v:0  -show_entries stream_tags=creation_time -of default=noprint_wrappers=1:nokey=1 video/$(/usr/bin/ls -X video | head -1) | sed -e 's/Z$//g')
#STTIME='08:45'
${HOME}/ffmpeg5/bin/ffmpeg \
    -y \
    -f concat -safe 0 -i vidlist.txt \
    -i logo/aliengeek.gif \
    -i audio/151.mp3 \
    #-reconnect_streamed 1 -multiple_requests 1 -thread_queue_size 1024 -reconnect_at_eof 1 -i http://0.0.0.0:8000/stream \
    -filter_complex "drawtext=text='%{pts\:localtime\:$(date --date=${STTIME} +%s)\:%c %Z }':x='(w-text_w)'/32:y=10:font=Vera:fontsize=18:alpha=0.5:box=1:boxborderw=4",select="not(mod(n\,${SPEED}))",setpts=N/FRAME_RATE/TB,fps=${FPS},"overlay=x=main_w-overlay_w-(main_w*0.01):y=main_h-overlay_h-(main_h*0.01)" \
    -vcodec libx264 \
    -map 0:v:0 -map 2:a:0 -c:a aac -b:a 192k \
    -shortest \
output/timelapse.mp4
