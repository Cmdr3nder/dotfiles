#!/usr/bin/env bash

get-edid HDMI-1 | sha256sum | awk '{print $1}'
