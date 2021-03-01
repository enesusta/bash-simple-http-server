#!/usr/bin/env bash

HTTP_OK="HTTP/1.1 200 OK"
KEEP_ALIVE="Connection: keep-alive"
CONTENT_TYPE="Content-Type: application/json"

RESPONSE_BODY=$(printf "{\"%s\":\"%s\"}" "status" "OK")
RESPONSE="$HTTP_OK\r\n$KEEP_ALIVE\r\n$CONTENT_TYPE\r\n\r\n${2:-$RESPONSE_BODY}\r\n"

while { echo -en "$RESPONSE"; } | nc -l "${1:-8080}"; do
  echo "================================================"
done
