#!/bin/bash

#SBATCH --job-name=simulation
#SBATCH --account=biostat
#SBATCH --partition=students-12c128g

#SBATCH --time=12:00:00
#SBATCH --mem-per-cpu=10gb

R CMD BATCH --no-save --no-restore HW4_simulation_execute.R
