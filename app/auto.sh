#!/bin/bash

controlc()
# Function to handle interrupts
{
  echo "User abort request..."
  exit 
}

trap controlc 2

directories=(
  "./scenarios/process"
  "./scenarios/network"
  "./scenarios/cloudlogs"
)

# Get available tests
flist=()
for dir in "${directories[@]}"; do
  flist+=($(find "$dir" -type f -name "*.sh"))
done
length=${#flist[@]}

# Set interval randomization limits
mintime=100
maxtime=1800
difftime=$((maxtime-mintime+1))


# Show what tests will be run
for i in "${flist[@]}"
do
   tname=`echo $i|cut -d'.' -f1| tr '_' ' '`
   echo "Running $tname"
done

#Initial test timeout
timeout=30

while true; do
  sleep $timeout
  testtorun=$(($RANDOM%$length))
  ./scenarios/${flist[$testtorun]}
  timeout=$(($(($RANDOM%$difftime))+mintime))
  echo "Sleeping $timeout seconds"
done