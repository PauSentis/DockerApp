#!/bin/bash
set -e

rm -f /dockerApp/tmp/pids/server.pid

exec "$@"
