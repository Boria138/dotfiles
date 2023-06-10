#!/bin/bash

DATE=$(date +'%H:%M')
IMAGE=" "
COLOR="#88C0D0"

echo "%{A:gsimplecal &:}%{F$COLOR}$IMAGE%{F-}$DATE%{A}"
