import os
import osproc
import strutils

proc main(): auto =

    let help = """tt - a tea timer

    Usage: tt TIME
    start a timer with the format: 4m30

    where minutes and seconds are separated by "m"

    Available options:
    -h,--help                Show this help text
    TIME                     in the format #m#
    """
    try:
        if paramCount() > 0 and (paramStr(1) != "-h" or paramStr(1) != "--help"):
            let time = paramStr(1)
            echo time
            let timings = time.split("m")
            var sec = 0
            var count = 0
            for t in timings:
                if count == 0:
                    sec = sec + (parseInt(t) * 60)
                else:
                    sec = sec + parseInt(t)
                    count = count + 1

            while sec >= 10:

                echo sec

                if execCmd("sleep 10") == 0:
                    echo ".."
                    sec = sec - 10
                else:
                    echo "failed"
            if execCmd("echo 'tea is done' | espeak") == 0:
                echo "done"
            elif execCmd("say tea is done") == 0:
                echo "done"
            else:
                echo "say|espeak not available on this os"

        else:
            echo help
    except OSError:
      discard

main()
