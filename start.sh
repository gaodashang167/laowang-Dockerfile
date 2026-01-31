#!/bin/sh

echo "========================================="
echo "Starting application..."
echo "========================================="

echo "Current directory: $(pwd)"
echo ""
echo "Checking .npm directory:"
ls -la .npm/ || echo ".npm not found!"

echo ""
echo "Environment variables:"
echo "UUID: $UUID"
echo "FILE_PATH: $FILE_PATH"
echo "NEZHA_SERVER: $NEZHA_SERVER"

echo ""
echo "Starting node-sbx..."
npx node-sbx &

echo "Waiting 15 seconds..."
sleep 15

echo ""
echo "Checking processes:"
ps aux | grep -E "(web|bot|php|node)" | grep -v grep

echo ""
echo "Checking .npm directory after node-sbx start:"
ls -la .npm/

echo ""
echo "Starting Nginx..."
nginx -g 'daemon off;'
