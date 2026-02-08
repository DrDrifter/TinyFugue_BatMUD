/def do_chan_setup = \
    /let chan_file ~/.tf/chan_capture.txt
    /if (chan_setup) \
        /return%; \
    /else \
        /if (chan_stream !~ "") \
            /test $[tfclose(chan_stream)]%; \
            /unset chan_stream%; \
        /endif%; \
        /set chan_stream $[tfopen(chan_file, "w")]%; \
        /if (!tfwrite(chan_stream, "Channel Capture Window")) \
            /eval /echo -p % Error writing to chan capture file from creation.%; \
            /return -1%; \
        /endif%; \
        /test tfclose(chan_stream)%; \
        /unset chan_stream%; \
        /set chan_stream $[tfopen(chan_file, "a")]%; \
    /endif%; \
    /set chan_setup 1

/do_chan_setup

/def addchan = \
    /let cn %{*}%; \
    /let chan_capture $(/expr %{cn}_capture)%; \
    /if (chan_capture) \
        /eval /echo -p % You are already capturing that channel (%{cn}).%; \
        /return -1%; \
    /endif%; \
    /eval /echo -p % You are now capturing the channel %{cn}.%; \
    /set %{cn}_capture 1%; \
    /if (cn =~ "tells") \
        /def -mregexp -t'^(?!\\d{2}:\\d{2}:\\d{2})(.+? tell|tells(?:\\(.*\\) ).+?\\s?: .*)' %{cn}_chan_cap1 = \
            /if (!tfwrite(chan_stream, %%{P1})) \
                /eval /echo -p % Could not write to chan capture file from tells capture1.%%; \
                /return -1%%; \
            /endif%%; \
            /def -mregexp -t'(\\\\s{4}.*)' %{cn}_chan_cap2 = \
                /if (!tfwrite(chan_stream, %%%{P1})) \
                    /eval /echo -p % Could not write to chan capture file from tells capture2.%%%; \
                    /return -1%%%; \
                /endif%%; \
            /def -F -p20 -mregexp -t'^[\\\\S]+' %{cn}_chan_cap2_kill = \
                /undef %{cn}_chan_cap2%%%; \
                /undef %{cn}_chan_cap2_kill%; \
        /return%; \
    /elseif (cn =~ "says") \
        /def -mregexp -t'^(?!\\d{2}:\\d{2}:\\d{2})(.+? \w+s: .*)' %{cn}_chan_cap1 = \
            /if (!tfwrite(chan_stream, %%{P1})) \
                /eval /echo -p % Could not write to chan capture file from says capture1.%%; \
                /return -1%%; \
            /endif%%; \
            /def -mregexp -t'(\\\\s{4}.*)' %{cn}_chan_cap2 = \
                /if (!tfwrite(chan_stream, %%%{P1})) \
                    /eval /echo -p % Could not write to chan capture file from says capture2.%%%; \
                    /return -1%%%; \
                /endif%%; \
            /def -F -p20 -mregexp -t'^[\\\\S]+' %{cn}_chan_cap2_kill = \
                /undef %{cn}_chan_cap2%%%; \
                /undef %{cn}_chan_cap2_kill%; \
        /return%; \
    /endif%; \
    /def -mregexp -t'^(?!\\d{2}\\:\\d{2}\\:\\d{2})(.*?[^\\w\\s]+%{cn}[^\\w\\s]+?:.*)' %{cn}_chan_cap1 = \
        /eval /echo -p % In here. %%{P1}%%; \
        /if (!tfwrite(chan_stream, %%{P1})) \
            /eval /echo -p % Could not write to chan capture file from %{cn} capture1.%%; \
            /return -1%%; \
        /endif%%; \
        /def -mregexp -t'(\\\\s{4}.*)' %{cn}_chan_cap2 = \
            /if (!tfwrite(chan_stream, %%%{P1})) \
                /eval /echo -p % Could not write to chan capture file from %{cn} capture2.%%%; \
                /return -1%%%; \
            /endif%%; \
        /def -F -p20 -mregexp -t'^[\\\\S]+' %{cn}_chan_cap2_kill = \
            /undef %{cn}_chan_cap2%%%; \
            /undef %{cn}_chan_cap2_kill

/def rmchan = \
    /let cn %{*}%; \
    /let chan_capture $(/expr %{cn}_capture)%; \
    /if (!chan_capture) \
        /eval /echo -p % You are not currently capturing that channel (%{cn}).%; \
        /return -1%; \
    /endif%; \
    /undef %{cn}_chan_cap1%; \
    /undef %{cn}_chan_cap2%; \
    /undef %{cn}_chan_cap2_kill%; \
    /unset %{cn}_capture%; \
    /eval /echo -p % You are no longer capturing the channel %{cn}.
