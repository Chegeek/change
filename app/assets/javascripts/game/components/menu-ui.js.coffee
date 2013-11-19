Crafty.c 'MenuUI',

  init: ->
    @requires('2D, DOM')

    recipet = Crafty.e('Receipt').attr(x:300, y:40, w: 360, h:600).yPos(40).heightForAnimation(600)
    logo = Crafty.e('2D, DOM, Text, Logo').text('CHANG€').textFont(size: '70px').textColor("#373838").attr(w: 360, x: 300, y: 100, z: 1001)
    credits = Crafty.e('2D, DOM, Text').text('A game by Rothschild Games<br>@shayhdavidson & @yonbergman').textFont(size: '12px').textColor("#373838").attr(w: 320, x: 320, y: 500, z: 1001).css('text-align':'center')

    Game.sfx.playRegisterOpen()
    Crafty.e('SoundControls').attr(x: 895, y: 14).soundtrack(Game.soundtrack)
    Game.soundtrack.start()

    showButton = Crafty.e("Button")
    .text("Start Game")
    .attr(x: 300, y: 200)
    .bind('Click', => @_start())

    helpButton = Crafty.e("Button")
    .text("Help")
    .attr(x: 300, y: 240)
    .bind('Click', => @_help())

    @attach(recipet)

    recipet.attach(logo)
    recipet.attach(showButton)
    recipet.attach(helpButton)
    recipet.attach(credits)

    @bind('KeyDown', @_startWithSpace)
    recipet.animateUp()

  _startWithSpace: (e) ->
    return unless e.key == Crafty.keys['SPACE']
    @_start()

  _start: ->
    @unbind('KeyDown', @_startWithSpace)
    Crafty.scene "game"

  _help: ->
    # do something.