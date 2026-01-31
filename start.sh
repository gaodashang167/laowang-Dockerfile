#!/bin/sh

echo "Starting node-sbx..."
npx node-sbx &

echo "Waiting for node-sbx to initialize..."
sleep 10

echo "Starting Nginx..."
nginx -g 'daemon off;'
```

## 关键改进

1. ✅ **预下载所有文件** - 在构建时从 `https://amd64.ssss.nyc.mn/` 下载
2. ✅ **文件放到 .npm 目录** - 符合 node-sbx 的预期
3. ✅ **包含 v1 哪吒** - 下载了 `php` (哪吒 v1 agent)
4. ✅ **添加 unzip** - 以防需要解压

这样 node-sbx 启动时就能找到预下载的文件,不会再报 `Download failed` 错误了! 🎯

GitHub 仓库只需要:
```
your-repo/
├── Dockerfile
├── nginx.conf
└── start.sh
