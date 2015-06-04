gulp = require 'gulp'
bs = require 'browser-sync'

module.exports = (config, list)->
  gulp.task 'watch', list, ->
    gulp.watch [
      "#{config.src}/**/*.jade"
      "#{config.tmp}/serve/**/*.html"
      "#{config.src}/coffee/**/*.coffee"
      "#{config.tmp}/serve/js/**/*.js"
      "#{config.src}/sass/**/*.scss"
      "#{config.tmp}/serve/css/**/*.css"
      "#{config.src}/images/**/*"
      "#{config.tmp}/serve/images/**/*"
    ]
    .on 'change', bs.reload

    gulp.watch "#{config.src}/**/*.jade", ['jade']
    gulp.watch "#{config.src}/sass/**/*.scss", ['sass']
    gulp.watch "#{config.src}/coffee/**/*.coffee", ['coffee']
    gulp.watch "#{config.src}/images/**/*", ['image']
