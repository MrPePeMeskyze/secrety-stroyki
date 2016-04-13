// Скрипт для выпадающего меню
$(function(){
  var ie7BagFix = false;
  var isOpened = false;

  var openedState = function(event) {
    event.preventDefault()

    var $this = ($(this).is(".nav-item")) ? $(this) : $(event.target).closest(".nav-item")
    isOpened = $this

    $this.addClass("show-nav")

    var parent = $this,
    menu = $this.find(".catalog-nav-submenu"),
    limBlock = $(".catalog-nav-inner"),
    leftLim = ($(window).width() - limBlock.width()) / 2,
    rightLim = (limBlock.offset().left + limBlock.width()),
    cssOptions = {},
    left,
    dif,
    destination,
    destinationValue;

    if (menu.length) {
			// центрируем относительно родительского элемента

				left = (menu.width() - parent.width()) / 2;

				// Если выпадающее меню вылазит за границы слева
				if (leftLim < 0) leftLim = 0;
				if((parent.offset().left - left) < leftLim) {
					dif = leftLim - (parent.offset().left - left);
					left = left - dif;
				}

				// Если выпадающее меню вылазит за границы справа
				if((parent.offset().left - left + menu.width()) > leftLim + limBlock.width()) {
					dif = (parent.offset().left - left + menu.width()) - (limBlock.offset().left + limBlock.width());
					left = left + dif+41;
        }

        destination = "left",
        destinationValue = -left
      
      cssOptions[destination] = destinationValue

      menu.css(cssOptions)
    }
  }
  var closedState = function(event) {
    event.preventDefault()

    var $this = ($(this).is(".nav-item")) ? $(this) : $(event.target).closest(".nav-item")
    $this.removeClass("show-nav")

    isOpened = false
  }
  $(".nav-item")
  .hover(openedState, closedState)
  .on("tap", function( event ) {
    var $this = $(event.target).closest("li")

    if ($this.find('ul, .catalog-nav-submenu').length){
     event.preventDefault()
     event.stopPropagation()
     if (!isOpened || $.contains( isOpened, $this ) || !$this.is(isOpened)) {
      $this.closest("ul, .catalog-nav-submenu").find(".nav-item").each(function() {
        $(this).removeClass("show-nav")
      })

      openedState(event)
    } else {
      closedState(event)
    }
    }
  })
  /*Top-buttob*/
  $('.top-button').click( function(){
    $('html,body').animate({
      scrollTop: 0
    }, 500);
    return false;
  });
  $(window).scroll(function(){
    var position = $('footer').offset().top

    if ( $(window).scrollTop() > 0 ) {
      $('.top-button').fadeIn('fast')
    } else {
      $('.top-button').fadeOut('fast');
    }

    var footerPaddingTop = parseInt($('footer').css('padding-top').replace("px", ""))
    var buttonToTopBottomOffset = 50

    if (($('.top-button').offset().top + $('.top-button').height()) >= $('footer').offset().top + footerPaddingTop) {
      $('.top-button').css({
        'position': 'absolute',
        'bottom': $('footer').height() + 40 + 'px'
      });
    }
    if (($(document).scrollTop() + window.innerHeight) < $('footer').offset().top + footerPaddingTop + buttonToTopBottomOffset)
      $('.top-button').css({
        'position': 'fixed',
        'bottom': buttonToTopBottomOffset + 'px'
      });
  });
})