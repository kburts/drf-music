module.exports = (grunt) ->
    grunt.initConfig(
        pkg: grunt.file.readJSON('package.json')
        coffee:
            files:
                src: ['src/js/**/*.coffee']
                dest: '../api/static/js/script.js'
    )
    
    grunt.loadNpmTasks('grunt-contrib-coffee')
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.registerTask('default', ['coffee'])
