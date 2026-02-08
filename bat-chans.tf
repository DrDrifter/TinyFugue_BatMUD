/def updatechans = \
    /let file /home/pi/build/chan_capture.txt%; \
    /let chanread=%; \
    /let chan_read_stream $[tfopen(file, "r")]%; \
    /while (tfread(chan_read_stream, chanread) != -1) \
        /if (chanread !~ "") \
            /eval /echo -p %chanread%; \
        /endif%; \
    /done%; \
    /test $[tfclose(chan_read_stream)]%; \
    /unset chan_read_stream%; \
    /let chan_read_stream $[tfopen(file, "w")]%; \
    /if (!tfwrite(chan_read_stream, "")) \
        /return -1%; \
    /endif%; \
    /test $[tfclose(chan_read_stream)]%; \
    /unset chan_read_stream

/repeat -1 i /updatechans
