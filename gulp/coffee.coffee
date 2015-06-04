gulp = require 'gulp'
$ = do require 'gulp-load-plugins'

module.exports = (config)->
  gulp.task 'coffee', [], ->
    gulp
      .src ["#{config.src}/coffee/**/*.coffee"]
      .pipe $.plumber
        handleError: (err)->
          console.log err
          @emit 'end'
      .pipe do $.coffee
      .pipe $.concat 'main.js'
      .pipe do $.jshint
      .pipe $.jshint.reporter 'default'
      .pipe gulp.dest "#{config.tmp}/serve/js"
      .pipe $.rename
        suffix: '.min'
      .pipe do $.uglify
      .pipe gulp.dest "#{config.tmp}/serve/js"
