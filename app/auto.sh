#!/bin/bash

controlc()
# Function to handle interrupts
{
  echo "User abort request..."
  exit 
}

trap controlc 2

directories=(
  "/app/scenarios/process"
  "/app/scenarios/network"
  "/app/scenarios/cloudlogs"
)

# Get available tests
flist=()
for dir in "${directories[@]}"; do
  flist+=($(find "$dir" -type f -name "*.sh"))
done
length=${#flist[@]}

# Set interval randomization limits
mintime=30
maxtime=120
difftime=$((maxtime-mintime+1))


# Show what tests will be run
for i in "${flist[@]}"
do
   tname=`echo $i|cut -d'.' -f1| tr '_' ' '`
   echo "Loading... $tname"
done

#Initial test timeout
timeout=10

while true; do
  sleep $timeout
  testtorun=$(($RANDOM%$length))
  timeout_duration=30
  command_to_run=${flist[$testtorun]}
  echo "Running $command_to_run"
  timeout $timeout_duration $command_to_run
  timeout=$(($(($RANDOM%$difftime))+mintime))
  echo "Sleeping $timeout seconds"
done
