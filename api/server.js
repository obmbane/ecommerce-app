const express = require('express');
const sql = require('mssql');
const cors = require('cors');

const app = express();
const healthApp = express();
const PORT = process.env.PORT || 4000;
const HEALTH_PORT = process.env.HEALTH_PORT || 4001;

app.use(cors());
app.use(express.json());

const dbConfig = {
  server: process.env.DB_SERVER,
  database: process.env.DB_NAME,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  options: {
    encrypt: true,
    trustServerCertificate: false,
  },
};

let pool = null;

async function getPool() {
  if (!pool) {
    pool = await sql.connect(dbConfig);
  }
  return pool;
}

healthApp.get('/health', (req, res) => {
  res.json({ status: 'ok' });
});

app.get('/products', async (req, res) => {
  try {
    const db = await getPool();
    const result = await db.request().query(
      'SELECT id, name, description, price, image_url FROM products WHERE active = 1 ORDER BY name'
    );
    res.json(result.recordset);
  } catch (err) {
    console.error('DB error:', err.message);
    res.status(500).json({ error: 'Failed to load products' });
  }
});

app.listen(PORT, () => {
  console.log(`API running on port ${PORT}`);
});

healthApp.listen(HEALTH_PORT, () => {
  console.log(`Health check running on port ${HEALTH_PORT}`);
});
