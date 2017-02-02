#!/bin/bash

app_name=$1

echo "DOING: ssh $app_name.app@push.drieapp.co configure environment -s GITHUB_CLIENT_ID=1f362ac9d6f2b921751a"
ssh $app_name.app@push.drieapp.co configure environment -s GITHUB_CLIENT_ID=1f362ac9d6f2b921751a

echo "DOING: ssh $app_name.app@push.drieapp.co configure environment -s GITHUB_SECRET=a567f25129417cf3c14ad107c17bfa4487590a9c"
ssh $app_name.app@push.drieapp.co configure environment -s GITHUB_SECRET=a567f25129417cf3c14ad107c17bfa4487590a9c

echo "DOING: ssh $app_name.app@push.drieapp.co configure environment -s DATABASE_URI=postgres://higihync:x3SJKwr5TcPQB0K68-DKfM2xF1sEUn8_@elmer.db.elephantsql.com:5432/higihync"
ssh $app_name.app@push.drieapp.co configure environment -s DATABASE_URI=postgres://higihync:x3SJKwr5TcPQB0K68-DKfM2xF1sEUn8_@elmer.db.elephantsql.com:5432/higihync
