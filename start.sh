#!/bin/sh

echo "Starting node-sbx on port 3000..."
npx node-sbx &

echo "Waiting for node-sbx to start..."
sleep 5

echo "Starting Nginx on port 80..."
nginx -g 'daemon off;'
```

## 工作原理
```
Internet → Apply.build → Nginx (80) → node-sbx (3000)
```

- **Nginx** 监听 80 端口,接收外部请求
- **node-sbx** 在后台运行,监听 3000 端口
- **Nginx** 将请求转发给 node-sbx
- **健康检查** `/health` 由 Nginx 直接返回 200

### GitHub 仓库结构
```
your-repo/
├── Dockerfile
├── nginx.conf
└── start.sh
