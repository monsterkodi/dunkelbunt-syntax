
module.exports = (grunt) ->

    grunt.initConfig
        pkg: grunt.file.readJSON 'package.json'

        salt:
            options:
                dryrun:  false
                verbose: false
                refresh: false
            style: 
                options:
                    verbose:     false
                    textMarker:  '//!!'
                    textPrefix:  '/*'
                    textFill:    '*  '
                    textPostfix: '*/'
                files:
                    'asciiText' : ['*.styl']

        stylus:
            options:
                compress: false
            compile:
                files:
                    'index.css': ['dunkelbunt.styl']

        watch:
          scripts:
            files: ['*.styl']
            tasks: ['salt', 'stylus']

        bumpup:
            file: 'package.json'

    ### 
    npm install --save-dev grunt-contrib-stylus
    npm install --save-dev grunt-contrib-watch
    npm install --save-dev grunt-bumpup
    npm install --save-dev grunt-pepper
    ###

    grunt.loadNpmTasks 'grunt-contrib-stylus'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-bumpup'
    grunt.loadNpmTasks 'grunt-pepper'

    grunt.registerTask 'default',   [ 'build' ]
    grunt.registerTask 'build',     [ 'bumpup', 'salt', 'stylus' ]
