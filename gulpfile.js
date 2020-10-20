const gulp = require('gulp');
const sass = require('gulp-sass');
const webpack = require('webpack-stream');
const uglify = require("gulp-uglify");
const del = require("del");
const cssnano = require("cssnano");
const browsersync = require("browser-sync").create();
const newer = require("gulp-newer");
const plumber = require("gulp-plumber");
const postcss = require("gulp-postcss");
const atImport = require('postcss-import');
const rename = require("gulp-rename");
const sourcemaps = require("gulp-sourcemaps");
const autoprefixer = require("autoprefixer");

const paths = {
    styles: {
        src: "./app/assets/styles/**/*.scss",
        dest: "./app/dist/styles/"
    },
    scripts: {
        src: "./app/assets/scripts/**/*.js",
        dest: "./app/dist/scripts/"
    },
    images: {
        src: "./app/assets/images/*",
        dest: "./app/dist/images/"
    },
    fonts: {
        src: "./app/assets/fonts/*",
        dest: "./app/dist/fonts/"
    }
}

// BrowserSync
function browserSync(done) {
    browsersync.init({
        server: "./app"
    });
    done();
}

// BrowserSync Reload
function browserSyncReload(done) {
    browsersync.reload();
    done();
}

// Clean Up
function clean() {
    return del(["app/dist"]);
}

// Optimize Styles
function styles() {
    const plugins = [
        atImport(),
        autoprefixer({ browsers: ["last 2 versions"] }),
        cssnano()
    ];
    return gulp
        .src(paths.styles.src)
        .pipe(
            plumber({
                errorHandler: function(err) {
                    console.log(err);
                    this.emit("end");
                }
            })
        )
        .pipe(sourcemaps.init())
        .pipe(sass({
            includePaths: ['./node_modules'],
            outputStyle: "expanded" }
            ))
        .pipe(postcss(plugins))
        .pipe(sourcemaps.write('.'))
        .pipe(gulp.dest(paths.styles.dest))
        .pipe(rename({ suffix: ".min" }))
        .pipe(gulp.dest(paths.styles.dest))
        .pipe(browsersync.stream());
}

// Optimize Scripts
function scripts() {
    return gulp
        .src(paths.scripts.src, { sourcemaps: true })
        .pipe(
            plumber({
                errorHandler: function(err) {
                    console.log(err);
                    this.emit("end");
                }
            })
        )
        .pipe(webpack({
            mode: 'development',
            module: {
                rules: [
                    {
                        test: /\.js$/,
                        use: {
                            loader: 'babel-loader',
                            options: {
                                presets: ['@babel/preset-env']
                            }
                        }
                    }
                ]
            }
        }))
        .pipe(
            uglify({
                compress: {
                    unused: false
                }
            })
        )
        .pipe(rename({ basename: 'script', suffix: ".min" }))
        .pipe(gulp.dest(paths.scripts.dest))
        .pipe(browsersync.stream());
}

// Package Images
function images() {
    return gulp
        .src(paths.images.src)
        .pipe(gulp.dest(paths.images.dest));
}

// Package Fonts
function fonts() {
    return gulp
        .src(paths.fonts.src)
        .pipe(gulp.dest(paths.fonts.dest));
}

// Watch Files
function watchFiles() {
    gulp.watch(paths.styles.src, styles);
    gulp.watch(paths.scripts.src, scripts);
    gulp.watch(paths.images.src, images);
    gulp.watch(paths.fonts.src, fonts);
}

const watch = gulp.parallel(watchFiles, browserSync);

// Build Assets
const build = gulp.series(
    clean,
    gulp.parallel(styles, scripts, images, fonts),
    watch
);

// Tasks
exports.clean = clean;
exports.styles = styles;
exports.scripts = scripts;
exports.fonts = fonts;
exports.watch = watch;
exports.build = build;

// Default Task
exports.default = build;
