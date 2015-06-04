gulp = require 'gulp'
$ = do require 'gulp-load-plugins'

module.exports = (config)->
  gulp.task 'build:styles', ['sass'], ->
    gulp
      .src ["#{config.tmp}/serve/css/**/*.css"]
      .pipe gulp.dest "#{config.dist}/css"
  gulp.task 'build:scripts', ['coffee'], ->
    gulp
      .src ["#{config.tmp}/serve/js/**/*.js"]
      .pipe gulp.dest "#{config.dist}/js"
  gulp.task 'build:image', ['image'], ->
    gulp
      .src ["#{config.tmp}/serve/images/**/*"]
      .pipe gulp.dest "#{config.dist}/images"
  gulp.task 'build:html', ['jade'], ->
    gulp
      .src ["#{config.tmp}/serve/**/*.html"]
      .pipe gulp.dest "#{config.dist}"
  gulp.task 'build', ['clean'], ->
    gulp.start 'build:styles'
    gulp.start 'build:scripts'
    gulp.start 'build:image'
    gulp.start 'build:html'
