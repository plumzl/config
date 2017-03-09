#!/bin/bash

vs () {
    file_name=${1%%:*}
    num=${1##*:}
    vi $file_name +${num}
}
