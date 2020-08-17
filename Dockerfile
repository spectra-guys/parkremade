FROM jrottenberg/ffmpeg:3.4-alpine

# Run as a separate user
RUN adduser -D streamer
USER streamer

# Stream the bg.png to the channel given by the stream key. Based on https://discuss.dev.twitch.tv/t/guide-how-to-stream-a-test-image-for-extension-testing/16646
ENTRYPOINT []
CMD ffmpeg  -i https://github.com/spectra-guys/parkremade/blob/master/video.mp4 -f flv -vcodec libx264 -pix_fmt yuv420p -preset fast -r 15 -g 30 rtmp://bangalore.restream.io/live/$TWITCH_STREAMKEY
#-stream_loop -1 -i "$SOURCE" -deinterlace \
   # -vcodec libx264 -pix_fmt yuv420p -preset $QUAL -r $FPS -g $(($FPS * 2)) -b:v $VBR \
   # -acodec libmp3lame -ar 44100 -threads 6 -qscale 3 -b:a 712000 -bufsize 512k \
    #-f flv "rtmp://bangalore.restream.io/live/$KEY"