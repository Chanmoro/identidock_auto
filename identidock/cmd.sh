#!/bin/bash
set -e

echo '$ENV: '$ENV

if [ "$ENV" = 'DEV' ]; then
  echo "Running as Development"
  exec python "identidock.py"
else
  echo "Running as Production"
  exec uwsgi --http 0.0.0.0:9090 \
             --wsgi-file /app/identidock.py \
             --callable app \
             --stats 0.0.0.0:9191
fi