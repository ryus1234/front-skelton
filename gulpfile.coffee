gulp = require 'gulp'
gutil = require 'gulp-util'
wrench = require 'wrench'
del = require 'del'

config =
  src: 'src'
  dist: 'dist'
  tmp: '.tmp'
  errorHandler: (title)->
    (err)->
      gutil.log gutil.colors.red "[#{title}]", err.toString()
      @emit 'end'

# wrench
#   .readdirSyncRecursive './gulp'
#   .filter (file)->
#     (/\.(js|coffee)$/i).test file
#   .map (file)->
#     require("./gulp/#{file}")(config)
require("./gulp/sass.coffee")(config)
require("./gulp/coffee.coffee")(config)
require("./gulp/jade.coffee")(config)
require("./gulp/image.coffee")(config)
require("./gulp/watch.coffee")(config, ['sass','coffee','jade','image'])
require("./gulp/serve.coffee")(config)
require("./gulp/build.coffee")(config)

gulp.task 'clean', (done)->
  del [config.dist, config.tmp], done

gulp.task 'default', [], ->
  gulp.start 'build'
