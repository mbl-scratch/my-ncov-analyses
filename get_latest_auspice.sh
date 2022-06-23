#!/usr/bin/env bash

# Set paths.
date_now=$(date +%F)
source_dir="/data/geco_proj_dir/weekly_report/nextstrain/ncov/auspice"
json_glob="ncov_ph_omiweekly_subsampling*"
dest_dir="/data/geco_proj_dir/weekly_report/nextstrain/my-ncov-analyses/"

# Copy renamed json files to auspice dir.
for j in ${source_dir}/${json_glob}
do
  k="my-ncov-analyses$(basename $j | cut -c 5-)"
  echo $j
  echo $k
  cp $j "${dest_dir}/auspice/$k"
done

# Git add, commit, pull, and push.
cd ${dest_dir}
git add .
git commit -m "Updated nextstrain build this ${date_now}"
git pull origin main
git push origin main

