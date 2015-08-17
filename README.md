## git-commiters [![npm](https://img.shields.io/npm/v/git-commiters.svg)](https://npmjs.org/package/git-commiters)

[![Build Status](https://img.shields.io/travis/snowyu/git-commiters.js/master.svg)](http://travis-ci.org/snowyu/git-commiters.js)
[![Code Climate](https://codeclimate.com/github/snowyu/git-commiters.js/badges/gpa.svg)](https://codeclimate.com/github/snowyu/git-commiters.js)
[![Test Coverage](https://codeclimate.com/github/snowyu/git-commiters.js/badges/coverage.svg)](https://codeclimate.com/github/snowyu/git-commiters.js/coverage)
[![downloads](https://img.shields.io/npm/dm/git-commiters.svg)](https://npmjs.org/package/git-commiters)
[![license](https://img.shields.io/npm/l/git-commiters.svg)](https://npmjs.org/package/git-commiters)

A [_Node.js_][nodejs] function module providing commiters stats for your git repository.

Statistical summary of various infomation about git commiter.

* list of the commiters
* count of the commiters
* count of commits via commiters
* count of insertions via commiters
* count of deletions via commiters


## Usage

```js
var gitCommiters = require('git-commiters');

gitCommiters('.', function(err, result){
  if (err)
    console.log(err);
  else
    console.log(result);
});

```

## API

    gitCommiters = require('git-commiters')

* gitCommiters(options, callback): asynchronous get the stats infomation of the git commiters
  * options *(String|Object)*: the git's working directory if it's string.
    * cwd *(String)*: the git's working directory.
    * gitDir *(String)*: the git directory(`.git`).
    * revisionRange *(String)*: Show only commits in the specified revision range.
      It defaults to `HEAD`. You can specify a branch too. More details to see [gitrevisions](http://git-scm.com/docs/gitrevisions)
    * path *(String)*: list commiters only for the specified path(file). defaults to all.

## License

MIT
