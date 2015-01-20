gulp = require 'gulp'
gulp_source = require 'vinyl-source-stream'
glob = require 'glob'
coffeeify = require 'coffeeify'
browserify = require 'browserify'

gulp.task 'generate js file', ->
  browserify('./source/scripts/app.coffee')
    .transform('coffeeify')
    .bundle()
    .pipe gulp_source 'pebble-js-app.js'
    .pipe gulp.dest './src/js/'

gulp.task 'copy c file', ->
  gulp.src('source/**/*.+(c|h)')
    .pipe gulp.dest 'src/'

gulp.task 'default', ['generate js file', 'copy c file']
