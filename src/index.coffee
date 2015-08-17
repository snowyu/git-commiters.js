isObject  = require 'util-ex/lib/is/type/object'
objMap    = require 'util-ex/lib/object/map'
gitLog    = require './git-log'

'use strict'


processSync = (stdout) ->
  getCommittersFrom = (entries) ->
    list = {}
    total = entries.length
    i = 0
    while i < total
      s = entries[i]
      committer = list[s]
      parts = undefined
      if !isObject(committer)
        committer = list[s] = {}
        parts = s.split ' '
        committer.email = parts.pop()
        committer.name = parts.join ' '
        committer.deletions = 0
        committer.insertions = 0
        committer.commits = 0
      committer.commits++ #+= 1
      s = entries[i + 1]
      parts = s.match(/([\d]+)\s*insertion/)
      parts and (committer.insertions += parseInt(parts[1]))
      parts = s.match(/([\d]+)\s*deletion/)
      parts and (committer.deletions += parseInt(parts[1]))
      i += 2
    objMap list

  entries = stdout.split('\n').filter Boolean
  list = getCommittersFrom(entries)

process = (stdout, done) ->
  done null, processSync(stdout)
  return

module.exports = listCommiters = (aOptions, done)->
  gitLog aOptions, (err, result)->
    return done(err) if err
    process(result, done)
    return
  return

listCommiters.process = process
listCommiters.processSync = processSync