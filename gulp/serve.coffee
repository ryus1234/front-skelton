
gulp = require 'gulp'
bs = require 'browser-sync'

module.exports = (config)->
  gulp.task 'serve', ['watch'], ->
    bs
      notify: true
      port: 9000
      server:
        baseDir: [config.tmp + '/serve', config.src]
        routes:
          '/bower_components': 'bower_components'
