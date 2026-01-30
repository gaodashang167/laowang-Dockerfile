const express = require('express');
const app = express();

app.get('/health', (req, res) => {
  res.status(200).send('OK');
});

app.get('/', (req, res) => {
  res.status(200).send('Service Running');
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, '0.0.0.0', () => {
  console.log(`Health check server running on port ${PORT}`);
});
```

### GitHub 仓库结构:
```
your-repo/
├── Dockerfile          (上面修改后的版本)
├── healthCheck.js      (上面的代码)
└── package.json        (可选,其实不需要了)
