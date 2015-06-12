
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

        shell:
            apm:
                command: 'apm publish patch'

    ### 
    npm install --save-dev grunt-contrib-stylus
    npm install --save-dev grunt-contrib-watch
    npm install --save-dev grunt-pepper
    npm install --save-dev grunt-shell
    ###

    grunt.loadNpmTasks 'grunt-contrib-stylus'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-pepper'
    grunt.loadNpmTasks 'grunt-shell'

    grunt.registerTask 'default',   [ 'build' ]
    grunt.registerTask 'build',     [ 'salt', 'stylus' ]
    grunt.registerTask 'publish',   [ 'build', 'shell:apm' ]
