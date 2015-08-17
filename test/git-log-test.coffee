chai            = require 'chai'
sinon           = require 'sinon'
sinonChai       = require 'sinon-chai'
should          = chai.should()
expect          = chai.expect
assert          = chai.assert
chai.use(sinonChai)

fs            = require('fs')
gitLog        = require('../src/git-log')

gitDir        = __dirname + '/fixtures/git.git'

describe 'git-log', ->
  it 'can get git log via defaults', (done) ->
    gitLog gitDir:gitDir, (err, result) ->
      expect(err).to.not.exist
      expect(result).to.equal """
        No one test@example.com

         1 file changed, 0 insertions(+), 0 deletions(-)
        Billy Everyteen your_email@example.com

         1 file changed, 1 insertion(+)
        Riceball LEE snowyu.lee@gmail.com

         1 file changed, 0 insertions(+), 0 deletions(-)

      """
      done()
  it 'can get git log via specified path', (done) ->
    gitLog gitDir:gitDir, path: 'readme', (err, result) ->
      expect(err).to.not.exist
      expect(result).to.equal """
        Billy Everyteen your_email@example.com

         1 file changed, 1 insertion(+)
        Riceball LEE snowyu.lee@gmail.com

         1 file changed, 0 insertions(+), 0 deletions(-)

      """
      done()

  it 'can get git log via specified branch', (done) ->
    gitLog gitDir:gitDir, revisionRange: 'dev', (err, result) ->
      expect(err).to.not.exist
      expect(result).to.equal """
        Other One test@example.com

         1 file changed, 0 insertions(+), 0 deletions(-)
        No one test@example.com

         1 file changed, 0 insertions(+), 0 deletions(-)
        Billy Everyteen your_email@example.com

         1 file changed, 1 insertion(+)
        Riceball LEE snowyu.lee@gmail.com

         1 file changed, 0 insertions(+), 0 deletions(-)

      """
      done()
