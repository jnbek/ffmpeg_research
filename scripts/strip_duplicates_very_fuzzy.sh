ffmpeg -i video/20220424_205717.MOV -vf mpdecimate=frac='0.55':hi='(64*25)':lo='(64*10)',setpts=N/FRAME_RATE/TB -an -y output/out_2.mp4
