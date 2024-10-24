#!/bin/zsh

run_kitty() {
    # Open Kitty terminal and wait for zsh to initialize
    kitty -e zsh -i -c "exit"
}

max_parallel_jobs=1
total_runs=10

for ((i=1; i<=total_runs; i++)); do
    run_kitty &  # Run in the background (parallel)

    # If the number of background jobs reaches the limit, wait for them to finish
    if (( i % max_parallel_jobs == 0 )); then
        wait
    fi
done

# Final wait for any remaining background processes to finish
wait

flock $ZSH/.zsh_load_time.lock -c "echo $exec_time_in_ms >> $ZSH/zsh_load_time.txt"
