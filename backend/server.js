const express = require('express');
const axios = require('axios');
const app = express();
const PORT = 8080;

app.use(express.json());

app.post('/detect', async (req, res) => {
  try {
    const response = await axios.post(
      'http://fraud-detection.ns-app.svc.cluster.local:3000/detect',
      req.body,
      { timeout: 5000 }
    );
    res.json(response.data);
  } catch (error) {
    console.error('Proxy error:', error.message);
    if (error.response) {
      res.status(error.response.status).json(error.response.data);
    } else {
      res.status(503).json({ message: 'Service unavailable' });
    }
  }
});

app.listen(PORT, '0.0.0.0', () => {
  console.log(`Backend proxy running on port ${PORT}`);
});