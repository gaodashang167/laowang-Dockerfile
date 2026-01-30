const express = require('express');
const app = express();

console.log('Starting Express server...');

app.get('/health', (req, res) => {
  console.log('Health check endpoint called');
  res.status(200).send('OK');
});

app.get('/', (req, res) => {
  console.log('Root endpoint called');
  res.status(200).send('Service Running');
});

app.get('*', (req, res) => {
  console.log('Wildcard endpoint called:', req.path);
  res.status(200).send('Alive - Path: ' + req.path);
});

const PORT = process.env.PORT || process.env.HEALTH_PORT || 8080;

const server = app.listen(PORT, '0.0.0.0', () => {
  console.log('=================================');
  console.log('Health server STARTED');
  console.log('Listening on 0.0.0.0:' + PORT);
  console.log('=================================');
});

server.on('error', (err) => {
  console.error('Server error:', err);
  process.exit(1);
});

process.on('uncaughtException', (err) => {
  console.error('Uncaught exception:', err);
});
