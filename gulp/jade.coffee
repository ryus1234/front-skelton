gulp = require 'gulp'
$ = do require 'gulp-load-plugins'

module.exports = (config)->
  gulp.task 'jade', [], ->
    gulp
      .src ["#{config.src}/**/*.jade"]
      .pipe $.plumber
        handleError: (err)->
          console.log err
          @emit 'end'
      .pipe $.jade
        pretty: true
      .pipe gulp.dest "#{config.tmp}/serve"
