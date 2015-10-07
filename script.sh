#!/bin/bash

exec 4<&0
exec < input.txt

exec 7>&1
exec > output.txt

./task

exec 0<&6 6<&-
exec 1>&6 6>&-

exec 1>&7 7>&-     
exec 0<&4 4<&- 
