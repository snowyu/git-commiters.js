chai            = require 'chai'
sinon           = require 'sinon'
sinonChai       = require 'sinon-chai'
should          = chai.should()
expect          = chai.expect
assert          = chai.assert
chai.use(sinonChai)

childProcess  = require('child_process')
fs            = require('fs')
gitCommiters  = require('../src/')

readFile = (file) ->
  fs.readFileSync file, 'utf-8'

describe 'git-commiters', ->
  describe '#process()', ->
    it 'can parse a single user commit', (done) ->
      inFixture = undefined
      outFixture = undefined
      inFixture = 'test/fixtures/actual/single-user-single-commit.log'
      outFixture = 'test/fixtures/expected/single-user-single-commit.json'
      stdout = readFile inFixture
      gitCommiters.process stdout, (err, result) ->
        expect(err).to.not.exist
        expect(result).to.deep.equal JSON.parse(readFile(outFixture))
        done()
        return
      return
    #it
    it 'can parse multiple commits from a single user', (done) ->
      inFixture = undefined
      outFixture = undefined
      inFixture = 'test/fixtures/actual/single-user-multiple-commit.log'
      outFixture = 'test/fixtures/expected/single-user-multiple-commit.json'
      stdout = readFile inFixture
      gitCommiters.process stdout, (err, result) ->
        expect(err).to.not.exist
        expect(result).to.deep.equal JSON.parse(readFile(outFixture))
        done()
        return
      return
    #it
    it 'can parse same user with different emails ', (done) ->
      inFixture = undefined
      outFixture = undefined
      inFixture = 'test/fixtures/actual/single-user-multiple-commit-different-mail.log'
      outFixture = 'test/fixtures/expected/single-user-multiple-commit-different-mail.json'
      stdout = readFile inFixture
      gitCommiters.process stdout, (err, result) ->
        expect(err).to.not.exist
        expect(result).to.deep.equal JSON.parse(readFile(outFixture))
        done()
        return
      return
    #it
    it 'can parse multiple user with same email', (done) ->
      inFixture = undefined
      outFixture = undefined
      inFixture = 'test/fixtures/actual/multi-user-same-mail.log'
      outFixture = 'test/fixtures/expected/multi-user-same-mail.json'
      stdout = readFile inFixture
      gitCommiters.process stdout, (err, result) ->
        expect(err).to.not.exist
        expect(result).to.deep.equal JSON.parse(readFile(outFixture))
        done()
        return
      return
    #it
    return
  describe 'when given wrong arguments', ->
    it 'should not throw when no path given via string', (done) ->

      f = ->
        gitCommiters null, ->
          done()
          return
        return

      expect(f).to.not.throw()
      return
    return
