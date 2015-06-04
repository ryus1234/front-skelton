gulp = require 'gulp'
$ = do require 'gulp-load-plugins'

module.exports = (config)->
  gulp.task 'sass', [], ->
    gulp
      .src ["#{config.src}/sass/**/*.scss"]
      .pipe $.plumber
        handleError: (err)->
          console.log err
          @emit 'end'
      .pipe do $.sass
      .pipe $.concat 'main.css'
      .pipe do $.autoprefixer
      .pipe do $.csscomb
      .pipe do $.combineMediaQueries
      .pipe do $.csslint
      .pipe do $.csslint.reporter
      .pipe gulp.dest "#{config.tmp}/serve/css"
      .pipe $.rename
        suffix: '.min'
      .pipe do $.minifyCss
      .pipe gulp.dest "#{config.tmp}/serve/css"
