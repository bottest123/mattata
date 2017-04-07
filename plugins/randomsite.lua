--[[
    Copyright 2017 wrxck <matthew@matthewhesketh.com>
    This code is licensed under the MIT. See LICENSE for details.
]]

local randomsite = {}
local mattata = require('mattata')

function randomsite:init()
    randomsite.commands = mattata.commands(
        self.info.username
    ):command('randomsite').table
    randomsite.help = '/randomsite - Sends the URL for a random, and somewhat-useless, website.'
end

randomsite.sites = {
    'http://heeeeeeeey.com/',
    'http://thatsthefinger.com/',
    'http://cant-not-tweet-this.com/',
    'http://weirdorconfusing.com/',
    'http://eelslap.com/',
    'http://www.staggeringbeauty.com/',
    'http://burymewithmymoney.com/',
    'http://endless.horse/',
    'http://www.fallingfalling.com/',
    'http://just-shower-thoughts.tumblr.com/',
    'http://ducksarethebest.com/',
    'http://www.trypap.com/',
    'http://www.republiquedesmangues.fr/',
    'http://www.movenowthinklater.com/',
    'http://www.partridgegetslucky.com/',
    'http://www.rrrgggbbb.com/',
    'http://beesbeesbees.com/',
    'http://www.sanger.dk/',
    'http://www.koalastothemax.com/',
    'http://www.everydayim.com/',
    'http://www.leduchamp.com/',
    'http://www.haneke.net/',
    'http://r33b.net/',
    'http://randomcolour.com/',
    'http://cat-bounce.com/',
    'http://www.sadforjapan.com/',
    'http://www.taghua.com/',
    'http://chrismckenzie.com/',
    'http://hasthelargehadroncolliderdestroyedtheworldyet.com/',
    'http://ninjaflex.com/',
    'http://iloveyoulikeafatladylovesapples.com/',
    'http://ihasabucket.com/',
    'http://corndogoncorndog.com/',
    'http://www.ringingtelephone.com/',
    'http://www.pointerpointer.com/',
    'http://imaninja.com/',
    'http://willthefuturebeaweso.me/',
    'http://www.ismycomputeron.com/',
    'http://www.nullingthevoid.com/',
    'http://www.muchbetterthanthis.com/',
    'http://www.ouaismaisbon.ch/',
    'http://www.yesnoif.com/',
    'http://iamawesome.com/',
    'http://www.pleaselike.com/',
    'http://crouton.net/',
    'http://corgiorgy.com/',
    'http://www.electricboogiewoogie.com/',
    'http://www.wutdafuk.com/',
    'http://unicodesnowmanforyou.com/',
    'http://www.crossdivisions.com/',
    'http://tencents.info/',
    'http://intotime.com/',
    'http://leekspin.com/',
    'http://minecraftstal.com/',
    'http://www.patience-is-a-virtue.org/',
    'http://whitetrash.nl/',
    'http://www.theendofreason.com/',
    'http://zombo.com',
    'http://pixelsfighting.com/',
    'http://baconsizzling.com/',
    'http://isitwhite.com/',
    'http://onemillionlols.com/',
    'http://www.omfgdogs.com/',
    'http://oct82.com/',
    'http://semanticresponsiveillustration.com/',
    'http://chihuahuaspin.com/',
    'http://potato.io/',
    'http://www.blankwindows.com/',
    'http://www.biglongnow.com/',
    'http://dogs.are.the.most.moe/',
    'http://tunnelsnakes.com/',
    'http://www.infinitething.com/',
    'http://www.trashloop.com/',
    'http://www.ascii-middle-finger.com/',
    'http://www.coloursquares.com/',
    'https://annoying.dog/',
    'http://spaceis.cool/',
    'https://thebigdog.club/',
    'http://buildshruggie.com/',
    'http://buzzybuzz.biz/',
    'http://yeahlemons.com/',
    'http://burnie.com/',
    'http://www.sealspin.com/'
}

function randomsite.get_keyboard()
    return mattata.inline_keyboard():row(
        mattata.row():callback_data_button(
            'Generate Another',
            'randomsite:new'
        )
    )
end

function randomsite:on_callback_query(callback_query, message)
    return mattata.edit_message_text(
        message.chat.id,
        message.message_id,
        randomsite.sites[math.random(#randomsite.sites)],
        nil,
        true,
        randomsite.get_keyboard()
    )
end

function randomsite:on_message(message)
    return mattata.send_message(
        message.chat.id,
        randomsite.sites[math.random(#randomsite.sites)],
        nil,
        true,
        false,
        nil,
        randomsite.get_keyboard()
    )
end

return randomsite