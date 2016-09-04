-- created by wrxck
local fact = {}
local JSON = require('dkjson')
local functions = require('functions')
local URL = require('socket.url')
local HTTP = require('socket.http')
function fact:init(configuration)
 fact.command = 'fact'
 fact.triggers = functions.triggers(self.info.username, configuration.command_prefix):t('fact', true):t('didyouknow', true).table
 fact.doc = 'Returns a random fact!'
end
function fact:action(msg, configuration)
 local api = configuration.fact_api
 local raw_fact = HTTP.request(api)
 local decoded_fact = JSON.decode(raw_fact)
 if decoded_fact.error then
  functions.send_reply(self, msg, configuration.errors.results)
  return
 end
 local math = math.random(#jdat)
 local output = decoded_fact[math].nid:gsub('<p>',''):gsub('</p>',''):gsub('&amp;','&'):gsub('<em>',''):gsub('</em>',''):gsub('<strong>',''):gsub('</strong>','')
 functions.send_message(self, msg.chat.id, output, nil, true)
end
return fact