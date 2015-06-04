gulp = require 'gulp'
jade = require 'gulp-jade'
coffee = require 'gulp-coffee'
styl = require 'gulp-stylus'
conn = require 'gulp-connect'
riot = require 'gulp-riot'
concat = require 'gulp-concat'
gulpif = require 'gulp-if'
uglify = require 'gulp-uglify'

paths =
  jade: 'web/static/js/*.jade'
  styl: 'web/static/style/*.css'
  js: ['node_modules/riot/riot.min.js', 'node_modules/aja/aja.min.js', 'node_modules/immutable/dist/immutable.min.js', 'src/components/*.jade', 'src/*.coffee']
  dest: 'priv/static/'

gulp.task 'jade', ->
  gulp.src paths.jade
    .pipe jade()
    .pipe gulp.dest(paths.dest)

gulp.task 'js', ->
  gulp.src paths.js
    .pipe gulpif(/\.coffee/, coffee())
    .pipe gulpif(/\.jade/, riot
      template: 'jade'
      compact: true
    )
    .pipe concat 'js/app.js'
    .pipe gulpif(process.env.CI is 'true', uglify())
    .pipe gulp.dest(paths.dest)

gulp.task 'styl', ->
  gulp.src paths.styl
    .pipe styl()
    .pipe gulp.dest(paths.dest)

gulp.task 'copy-asset', ->
  gulp.src ['lib/emoji/stylesheets/emoji.css', 'lib/emoji/emoji.png', 'src/CNAME']
    .pipe gulp.dest(paths.dest)

gulp.task 'copy', ['generate-json', 'copy-asset']
gulp.task 'default', ['jade', 'styl', 'js', 'copy']
gulp.task 'watch', ['default'], ->
  gulp.watch paths.jade, ['jade']
  gulp.watch paths.styl, ['styl']
  gulp.watch paths.js, ['js']
  conn.server
    root: 'build'
    port: 3001

gulp.task 'deploy', ->
  gulp.src './build/**/*'
    .pipe deploy
      cacheDir: 'tmp'
