# ./entrypoint s
if [ "$1" = "s" ]; then
    # Enter sleep mode
    echo "(In sleep/silent mode...)"
elif [ -t 0 ] ; then
    # Enter menu mode
    echo "(starting interactive shell)"
    # Start menu
    ./run_scenarios.sh
else
    echo "(starting non-interactive shell)"
    # Start automatic run
    ./auto.sh
fi