#!/bin/bash

# Function to get current date and time in the specified format
get_datetime() {
    date +"%d %b %Y %I:%M%p"
}

# Function to calculate average, minimum, and maximum
calculate_stats() {
    # Usage: calculate_stats <data_file> <start_time> <end_time>
    local data_file="$1"
    local start_time="$2"
    local end_time="$3"
    
    # Extract relevant data within the time interval
    local relevant_data=$(awk -v start="$start_time" -v end="$end_time" '$1" "$2>=start && $1" "$2<=end' "$data_file")
    
    # Extract memory and CPU values
    local memory_values=$(echo "$relevant_data" | awk '{print $4}' | cut -d':' -f2)
    local cpu_values=$(echo "$relevant_data" | awk '{print $6}' | cut -d':' -f2)
    
    # Calculate average, minimum, and maximum
    local memory_avg=$(echo "$memory_values" | awk '{ sum += $1; n++ } END { if (n > 0) print sum / n; }')
    local memory_min=$(echo "$memory_values" | sort -n | head -n 1)
    local memory_max=$(echo "$memory_values" | sort -n | tail -n 1)
    
    local cpu_avg=$(echo "$cpu_values" | awk '{ sum += $1; n++ } END { if (n > 0) print sum / n; }')
    local cpu_min=$(echo "$cpu_values" | sort -n | head -n 1)
    local cpu_max=$(echo "$cpu_values" | sort -n | tail -n 1)
    
    # Print results
    echo "$start_time - $end_time Memory-Average-Utilization:$memory_avg% (Min:$memory_min%, Max:$memory_max%) CPU-Average-Utlization:$cpu_avg% (Min:$cpu_min%, Max:$cpu_max%)"
}

# Main script

data_file="metrics.txt"
stats_file="stats.txt"

# Initial check if the data file exists, if not, create it with a header
if [ ! -f "$data_file" ]; then
    echo "Date-Time Memory CPU" > "$data_file"
fi

# Continuously gather metrics every five minutes
while true; do
    current_time=$(get_datetime)
    memory_util=$(free | awk '/Mem/{printf("%.2f"), $3/$2*100}')
    cpu_util=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    
    # Append metrics to the data file
    echo "$current_time Memory:$memory_util CPU:$cpu_util" >> "$data_file"
    
    # Check if there is enough data to calculate stats
    line_count=$(wc -l < "$data_file")
    if [ "$line_count" -ge 5 ]; then
        # Calculate stats for the last 5 entries
        start_time=$(head -n 1 "$data_file" | awk '{print $1, $2}')
        end_time=$(tail -n 1 "$data_file" | awk '{print $1, $2}')
        calculate_stats "$data_file" "$start_time" "$end_time" >> "$stats_file"
        
        # Remove the oldest entry to maintain a window of 5 entries
        sed -i '1d' "$data_file"
    fi
    
    # Wait for 5 minutes
    sleep 300
done

