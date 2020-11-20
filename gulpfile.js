const gulp = require('gulp');
const yargs = require('yargs');
const webpack = require('webpack-stream');
const cssnano = require("cssnano");
const atImport = require('postcss-import');
const autoprefixer = require("autoprefixer");
const plugins = require("gulp-load-plugins")({
    DEBUG: false,
    pattern: ['gulp-*', 'del'],
});

// Get env
const environment = (yargs.argv.production === undefined) ? 'development' : 'production';

// Set paths
const
    src = "source/assets/",
    dest = ".tmp/dist/",
    styles = {
        in: src + "stylesheets/**/*.scss",
        out: dest + "stylesheets/"
    },
    scripts = {
        in: src + "javascripts/**/*.js",
        out: dest + "javascripts/"
    },
    images = {
        in: src + "images/*",
        out: dest + "images/"
    },
    fonts = {
        in: src + "fonts/*",
        out: dest + "fonts/"
    },
    sassOpts = {
        includePaths: ['./node_modules'],
        outputStyle: "expanded"
    },
    postCssOptions = [
        atImport(),
        autoprefixer({ browsers: ["last 2 versions"]}),
        cssnano()
    ],
    webpackRules = {
        test: /\.js$/,
        use: {
            loader: 'babel-loader',
            options: {
                presets: ['@babel/preset-env']
            }
        }
    },
    uglifyOptions = {
        compress: {
            unused: false
        }
    };

function getWebpackOptions(env) {
    return {
        mode: env,
        module: {
            rules: [webpackRules]
        }
    }
}
// Define tasks
// Clean Up
function clean() {
    return plugins.del([dest]);
}

// Optimise Styles
function css() {
    return gulp.src(styles.in)
        .pipe(plugins.sourcemaps.init())
        .pipe(plugins.sass(sassOpts).on('error', plugins.sass.logError))
        .pipe(plugins.postcss(postCssOptions))
        .pipe(plugins.sourcemaps.write())
        .pipe(plugins.rename({ suffix: ".min" }))
        .pipe(gulp.dest(styles.out));
}

// Optimise Scripts
function js() {
    return gulp.src(scripts.in)
        .pipe(webpack(getWebpackOptions((environment))))
        .pipe(plugins.uglify(uglifyOptions))
        .pipe(plugins.rename({ basename: "application", suffix: ".min" }))
        .pipe(gulp.dest(scripts.out));
}

// Package images
function img() {
    return gulp.src(images.in)
        .pipe(gulp.dest(images.out));
}

// Package fonts
function fface() {
    return gulp.src(fonts.in)
        .pipe(gulp.dest(fonts.out));
}

// Macro tasks
// Build Assets
const build = gulp.series(
    clean,
    gulp.parallel(css, js, img, fface)
);

const watch = () => {
    gulp.watch(scripts.in, js);
}

// Exports
exports.clean = clean;
exports.css = css;
exports.js = js;
exports.fface = fface;
exports.img = img
exports.build = build;
exports.watch = watch;

// Default Task
exports.default = build;