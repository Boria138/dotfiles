#!/bin/bash

DATE=$(date +'%H:%M')
IMAGE=" "
COLOR="#F0C674"

echo "%{A:gsimplecal &:}%{F$COLOR}$IMAGE%{F-}$DATE%{A}"
