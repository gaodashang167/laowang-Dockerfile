const express = require('express');
const app = express();

app.get('/health', (req, res) => {
  console.log('Health check called');
  res.status(200).send('OK');
});

app.get('/', (req, res) => {
  res.status(200).send('Service Running');
});

app.use((req, res) => {
  res.status(200).send('Alive');
});

// 改用 8080 端口,避免和 node-sbx 冲突
const PORT = process.env.HEALTH_PORT || 8080;

app.listen(PORT, '0.0.0.0', () => {
  console.log(`=================================`);
  console.log(`Health server running on port ${PORT}`);
  console.log(`=================================`);
});
