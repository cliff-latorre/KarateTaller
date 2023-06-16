function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    myVarName: 'someValue',
    username: 'admin',
    password: 'adminpassword',

    Myurl: 'https://reqres.in'
  }
  if (env == 'local') {
    // customize
    // e.g. config.foo = 'bar';
    config.username = 'user';
    config.password = 'userpassword';
  } else if (env == 'dev') {
    // customize
  }
  else if (env == 'certi') {
      // customize
    }
  return config;
}
