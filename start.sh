#!/bin/sh

echo "========================================="
echo "Container started at $(date)"
echo "========================================="

echo "Current directory: $(pwd)"
echo "Files in current directory:"
ls -la

echo ""
echo "Files in .npm directory:"
ls -la .npm/ 2>/dev/null || echo ".npm directory not found"

echo ""
echo "Environment variables:"
echo "UUID: $UUID"
echo "NEZHA_SERVER: $NEZHA_SERVER"
echo "FILE_PATH: $FILE_PATH"

echo ""
echo "Testing node-sbx..."
which node
which npx
npm list -g node-sbx 2>/dev/null || echo "node-sbx not found globally"

echo ""
echo "Starting node-sbx in background..."
npx node-sbx &
NODE_SBX_PID=$!
echo "node-sbx PID: $NODE_SBX_PID"

echo ""
echo "Waiting 10 seconds..."
sleep 10

echo ""
echo "Checking if node-sbx is still running..."
ps aux | grep node-sbx || echo "node-sbx process not found"

echo ""
echo "Checking port 3000..."
netstat -tuln | grep 3000 || echo "Port 3000 not listening"

echo ""
echo "Starting Nginx..."
nginx -t
nginx -g 'daemon off;'
