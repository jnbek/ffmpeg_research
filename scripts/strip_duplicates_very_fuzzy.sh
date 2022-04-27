#!/bin/sh

ffmpeg -i video/VID_20220424_210110.mp4 -vf mpdecimate=frac='0.65':hi='(64*45)':lo='(64*15)',setpts=N/FRAME_RATE/TB -an -y output/out_cell.mp4

# Best effort on Night Vids filmed on the Galaxy A50 probably overkill though
# ffmpeg -i video/VID_20220424_210110.mp4 -vf mpdecimate=frac='0.65':hi='(64*45)':lo='(64*15)',setpts=N/FRAME_RATE/TB -an -y output/out_cell.mp4

# Good for Night Videos filmed with the AKASO
#ffmpeg -i video/VID_20220424_210110.mp4 -vf mpdecimate=frac='0.51':hi='(64*15)':lo='(64*10)',setpts=N/FRAME_RATE/TB -an -y output/out_cell.mp4
