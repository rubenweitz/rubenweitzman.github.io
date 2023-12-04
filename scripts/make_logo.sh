#!/bin/bash

# Use the provided path for the input image
input_image="/Users/rweitzman/OneDrive - Nexus365/PhD/rubenweitzman.github.io/images/Oxford_logo.png"

# Define the sizes as tuples
sizes=("70 70" "144 144" "150 150" "310 310" "310 150")

# Get the directory of the input image
dir=$(dirname "$input_image")

# Loop over the sizes and resize the image
for size in "${sizes[@]}"; do
    # Split the size into width and height
    IFS=' ' read -ra dimensions <<< "$size"
    width="${dimensions[0]}"
    height="${dimensions[1]}"

    # Format the output filename
    output_image="${dir}/Oxford_logo_${width}x${height}.png"

    # Resize the image
    convert "$input_image" -resize "${width}x${height}" "$output_image"
done