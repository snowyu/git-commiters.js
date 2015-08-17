exec                = require('child_process').exec
isRepositoryExists  = require './is-repository-exists'
isString            = require 'util-ex/lib/is/type/string'

'use strict'

gitOptions = '--pretty="%an %ae" --no-merges --shortstat'

module.exports = (aOptions, done)->
  aOptions  = cwd: aOptions if isString(aOptions)
  if aOptions
    revRange  = aOptions.revisionRange
    path      = aOptions.path

  gitCmd    = 'git'
  gitDir    = isRepositoryExists aOptions
  gitCmd   += " --git-dir='#{gitDir}'" if gitDir
  gitCmd   += " log #{gitOptions}"
  gitCmd   += " #{revRange}" if revRange
  gitCmd   += " -- #{path}" if path

  exec gitCmd, aOptions, (err, stdout) ->
    done err, stdout
    return
  return
