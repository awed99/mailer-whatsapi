export default {
    host: process.env.NODE_ENV == 'development' ? process?.env?.DB_HOST_DEV : process?.env?.DB_HOST_PROD, //'58.84.143.251',

    port: process.env.NODE_ENV == 'development' ? process?.env?.DB_PORT_DEV : process?.env?.DB_PORT_PROD,

    user: process.env.NODE_ENV == 'development' ? process?.env?.DB_USER_DEV : process?.env?.DB_USER_PROD,

    password: process.env.NODE_ENV == 'development' ? process?.env?.DB_PASS_DEV : process?.env?.DB_PASS_PROD,

    database: process.env.NODE_ENV == 'development' ? process?.env?.DB_NAME_DEV : process?.env?.DB_NAME_PROD
};
