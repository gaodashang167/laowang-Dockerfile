#!/bin/sh

# 启动 node-sbx 在后台
npx node-sbx > /dev/null 2>&1 &

# 等待一下让 node-sbx 初始化
sleep 3

# 启动健康检查服务器(前台运行)
exec node healthCheck.js
