#!/bin/bash
REPLAY_NAME=$1
VIDEO_NAME=$2
WINDOW_WIDTH=$(grep window_width ./system_user.conf | grep -oP '\d+')
WINDOW_HEIGHT=$(grep window_height ./system_user.conf | grep -oP '\d+')
FFMPEG_EXEC=ffmpeg
rm -f "$VIDEO_NAME"
./ygopro --auto-watch-no-wait --raw-video -r "$REPLAY_NAME" 2>&1 >/dev/null | "$FFMPEG_EXEC" -hwaccel cuda -r 60 -vcodec rawvideo -f rawvideo -pix_fmt rgb24 -s "${WINDOW_WIDTH}x${WINDOW_HEIGHT}" -i - "$VIDEO_NAME"
