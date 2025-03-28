const next = require('next');

const dev = process.env.NODE_ENV !== 'production';
const app = next({ dev });
const handle = app.getRequestHandler();

exports.handler = async (event) => {
  await app.prepare();
  return handle(event);
};
