(($) ->
  'use strict'
  $ ->
    dynBg = ->
      currentPage = $('body').attr('data-page') or 'default'
      if currentPage is 'default' or currentPage is 'contact'
        $('body').css 'background-color': 'black'
        return
      $('body').css
        'background-image': 'url(\'images/background-' + currentPage + '.jpg\')'
        'background-repeat': 'no-repeat'
        'background-size': 'cover'
        'background-position': 'center center'
        'background-attachment': 'fixed'
      return

    dynMenu = ->
      url = window.location.href.substr(window.location.href.lastIndexOf('/') + 1) or 'home'
      $('.header .navigation li a').each ->
        if url == $(this).attr('href').replace('/', '')
          $(this).parent().addClass 'active'
        return
      return

    dynFooter = ->
      currentPage = $('body').attr('data-page') or 'default'
      if currentPage == 'default'
        $('.footer').css
          'position': 'relative'
          'bottom': '0px'
          'top': '20px'
          'height': '100px'
          'line-height': '100px'
          'padding-bottom': '10px'
      return

    dynWork = ->

      getWork = (value) ->
        work = new StringBuilder
        work.append '<div class="case-study">'
        work.append '<div class="case-wrapper">'
        work.append '<div class="image-wrapper">'
        work.append '<img src="{p}" alt="" class="image-preview" />'.replace('{p}', value.image_preview)
        work.append '</div>'
        work.append '<div class="study">'
        work.append '<h1>{p}</h1>'.replace('{p}', value.title)
        work.append '<p>{p}</p>'.replace('{p}', value.description)
        work.append '<ul>'
        work.append '<li><span>Date:</span> {p}</li>'.replace('{p}', value.date)
        work.append '<li><span>Tools:</span> {p}</li>'.replace('{p}', value.tools)
        work.append '</ul>'
        work.append '<a href="#">SEE IT LIVE</a>'
        work.append '</div>'
        work.append '</div>'
        work.append '</div>'
        work.build()

      $.ajax(
        type: 'POST'
        url: 'work/data').success (res) ->
        $.each res, (k, v) ->
          $.each v, (key, value) ->
            $('.display-body').append getWork(value)
            return
          return
        return
      $('.order a').on 'click', (e) ->
        e.preventDefault()
        displayState = $(this).attr('data-display')
        $(this).parent().find('.active').removeClass 'active'
        $(this).addClass 'active'
        $('.display-body').fadeOut 200, ->
          $(this).attr 'data-display', displayState
          $(this).fadeIn 200
          return
        return
      $(document).on 'mouseenter', '.case-study', ->
        $(this).find('.case-wrapper').each ->
          $(this).find('.study').animate { 'top': '0px' }, 200
          return
        return
      $(document).on 'mouseleave', '.case-study', ->
        $(this).find('.case-wrapper').each ->
          $(this).find('.study').animate { 'top': '-400px' }, 200
          return
        return
      return

    dynLoader = ->
      now = new Date
      lHTML = new StringBuilder
      lHTML.append '<div class="loader">'
      lHTML.append '<div class="loading-bar">'
      lHTML.append '<h1>Trinton<span>Designs</span></h1>'
      lHTML.append '<span class="progress-fade">'
      lHTML.append '<span class="progress"></span>'
      lHTML.append '</span>'
      lHTML.append '</div>'
      lHTML.append '</div>'
      $('body').append lHTML.build()
      $('body').css 'overflow': 'hidden'
      anim = window.performance.timing.domContentLoadedEventStart - now
      anim = anim * -1 * 50
      $('.loading-bar .progress').animate { 'width': '100%' }, anim, ->
        $('.loader').fadeOut 500
        $('body').css 'overflow': 'auto'
        return
      return

    dynContact = ->
      form = $('#contact-form')
      form.on 'submit', (e) ->
        e.preventDefault()
        name = $(this).find('#name').val()
        email = $(this).find('#email').val()
        budget = $(this).find('#budget').val()
        message = $(this).find('#message').val()

        pattern = /.*[a-zA-Z]+.*/

        if name.match pattern
          console.log 'hello'
        return
      return
    StringBuilder = ->
      @string = []
      return

    StringBuilder.prototype =
      append: (str) ->
        @string.push str
        return
      build: ->
        @string.join ''
    PathFinder = do ->
      methods = {}
      url = window.location.href.toLowerCase()

      methods.match = (str, ind) ->
        path = url.match(/^(?:\/)?(.*?)(?:[\/])?$/i)[1].split('/').slice(3)
        if str == path[ind]
          return true
        false

      methods.get = (str, ind) ->
        path = url.match(/^(?:\/)?(.*?)(?:[\/])?$/i)[1].split('/').slice(3)
        path

      methods.debug = (str, ind) ->
        ind = ind or 'empty'
        path = url.match(/^(?:\/)?(.*?)(?:[\/])?$/i)[1].split('/').slice(3)
        if ind == 'empty'
          console.log path
          return
        console.log path[ind]
        return

      methods
    $(document).ready ->
      dynBg()
      dynMenu()
      dynFooter()
      dynContact()
      dynLoader();
      if PathFinder.match('work', 2)
        dynWork()
      return
    return
  return
) jQuery