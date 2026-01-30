const express = require('express');
const app = express();

app.get('/health', (req, res) => {
  console.log('Health check called');
  res.status(200).send('OK');
});

app.get('/', (req, res) => {
  res.status(200).send('Service Running');
});

// 处理所有路径
app.use((req, res) => {
  res.status(200).send('Alive');
});

const PORT = process.env.PORT || 3000;

app.listen(PORT, '0.0.0.0', () => {
  console.log(`=================================`);
  console.log(`Health server running on port ${PORT}`);
  console.log(`=================================`);
});
```

## 你的 GitHub 仓库结构
```
your-github-repo/
├── Dockerfile
├── start.sh
└── healthCheck.js
