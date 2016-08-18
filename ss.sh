#!/bin/bash
ls -l| awk '{ SUM += $5} END { print SUM }'
