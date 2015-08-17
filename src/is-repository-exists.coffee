fs        = require 'fs'

module.exports = (aOptions)->
  if aOptions
    gitDir   = aOptions.gitDir
    gitDir   = aOptions.cwd + '/.git' unless gitDir
    if fs.existsSync(gitDir)
      result = gitDir
    else
      throw new TypeError 'invalid .git repository at "'+ gitDir +'"'
  result

