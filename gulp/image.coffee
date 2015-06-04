gulp = require 'gulp'
$ = do require 'gulp-load-plugins'

module.exports = (config)->
  gulp.task 'image', [], ->
    gulp
      .src ["#{config.src}/images/**/*"]
      .pipe $.plumber
        handleError: (err)->
          console.log err
          @emit 'end'
      .pipe do $.imagemin
      .pipe gulp.dest "#{config.tmp}/serve/images"
