#!/bin/bash

# Function to get CPU Usage
echo "CPU Usage:"
mpstat 1 1 | awk '/Average/ {print 100 - $NF "% used"}'
echo ""

# Function to get Memory Usage
echo "Memory Usage:"
free -m | awk 'NR==2{printf "Used: %s MB, Free: %s MB (%.2f%% used)\n", $3, $4, $3*100/($3+$4)}'
echo ""

# Function to get Disk Usage
echo "Disk Usage:"
df -h --total | awk '/total/{printf "Used: %s, Free: %s (%.2f%% used)\n", $3, $4, $5}'
echo ""

# Function to get Top 5 Processes by CPU Usage
echo "Top 5 Processes by CPU Usage:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -6
echo ""

# Function to get Top 5 Processes by Memory Usage
echo "Top 5 Processes by Memory Usage:"
ps -eo pid,comm,%mem --sort=-%mem | head -6
echo ""
