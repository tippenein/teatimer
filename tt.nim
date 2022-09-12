import os
import osproc
import strutils


if paramCount() > 0:
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
    while sec >= 0:

        let remaining: string = cast[string](sec)
        echo  remaining
        echo ".."
        sec = sec - 10
        let g = execProcess("sleep", "", [remaining])
else:
    echo "Error: input time like this: 4m30"

