const winston = require('winston');
require('winston-splunk-httplogger');

const splunkTransport = new winston.transports.Http({
    host: 'your-ec2-public-ip',
    port: 8088,
    path: '/services/collector/event',
    ssl: false,
    headers: { 'Authorization': 'Splunk YOUR-HEC-TOKEN' },
});

const logger = winston.createLogger({
    level: 'info',
    transports: [splunkTransport]
});

module.exports = logger;
