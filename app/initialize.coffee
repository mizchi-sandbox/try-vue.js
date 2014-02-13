fs = require 'fs'
template = fs.readFileSync(__dirname + '/templates/simple.html');

Vue::attach = (selector) -> $(selector).append @$el

class Tweet
  constructor: (@name, @content)->
  erase: ->
    console.log 'selected', @$index
    @$parent.$data.tweets.splice @$index, 1

$ ->
  content = new Vue
    template: template
    data:
      message: 'vue.js!'
      counter: 0
      color: 'red'
      tweets: []
    methods:
      addTweet: ->
        @$data.tweets.push new Tweet 'foo', Date.now()

  setInterval ->
    content.$data.counter++
  , 1000

  content.attach 'body'
