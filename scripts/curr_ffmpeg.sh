#!/bin/sh
${HOME}/ffmpeg5/bin/ffmpeg \
	-y \
	-f concat -safe 0 -i vidlist.txt \
	-i logo/aliengeek.gif \
	-i audio/151.mp3 \
	-filter_complex "drawtext=text='%{pts\:localtime\:$(date --date='07:17' +%s)\:%c %Z }':x='(w-text_w)'/32:y=10:font=Vera:fontsize=20:alpha=0.5:box=1:boxborderw=4",select='not(mod(n\,8))',setpts=N/FRAME_RATE/TB,fps=60,"overlay=x=main_w-overlay_w-(main_w*0.01):y=main_h-overlay_h-(main_h*0.01)" \
	-vcodec libx264 \
	-map 0:v:0 -map 2:a:0 -c:a aac -b:a 192k \
	-shortest \
output/timelapse_all_4vids.mp4
