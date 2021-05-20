#!/bin/bash

#GET query for json result
response=$(curl --no-progress-meter  wttr.in/$1?format=j1)

#parse temp
temp_c=$(echo $response | jq -r '.current_condition[0].temp_C')

#parse feel like
feelsLikeC=$(echo $response | jq -r '.current_condition[0].FeelsLikeC')

#parse humidity
humidity=$(echo $response | jq -r '.current_condition[0].humidity')

#degree character
DEG=$'\u00b0'

printf "\nLocation: %s. \nTemp: %s(%s)%sC.\nHumidity: %s%%.\n\n" $1 $temp_c $feelsLikeC $DEG $humidity
