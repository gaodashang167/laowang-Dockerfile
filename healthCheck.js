const express = require('express');
const app = express();

// 设置健康检查路径
app.get('/health', (req, res) => {
  res.status(200).send('OK');  // 返回 200 OK
});

// 启动 HTTP 服务器
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Health check server running on port ${PORT}`);
});
