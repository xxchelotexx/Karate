function fn() {

  var config = {
    env: env,
    myVarName: 'someValue',
    mainUrl : 'https://dummyjson.com/'
  }
  const result = karate.callSingle('classpath:examples/DymmJson/login.feature')
  config.auth = {"Authorization": 'Bearer ${result.token}'}
  return config;
}