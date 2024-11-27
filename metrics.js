const express = require('express');
const promClient = require('prom-client');
const app = express();
const port = 3000;

// Create a Registry to register the metrics
const register = new promClient.Registry();

// Create a new counter metric for HTTP requests
const httpRequestDurationMicroseconds = new promClient.Histogram({
  name: 'http_request_duration_seconds',
  help: 'Histogram of HTTP request durations in seconds.',
  buckets: [0.1, 0.3, 0.5, 1, 2, 5, 10]
});
register.registerMetric(httpRequestDurationMicroseconds);

// Add a basic route to expose the metrics
app.get('/metrics', async (req, res) => {
  res.set('Content-Type', register.contentType);
  res.end(await register.metrics());
});

// Your existing Node.js application routes
app.get('/', (req, res) => {
  res.send('Hello, world!');
});

// Start the server
app.listen(port, () => {
  console.log(`Node.js app listening at http://localhost:${port}`);
});
