resizeItems = function(){
    /***** Banner *****/
    if($("#banner").length > 0){
        if($(window).width() > 750){
            $("#banner-container").css('min-height',$(window).height() - $("#clients-bar-container").height());
        } else {
            $("#banner-container").css('min-height',$(window).height());
        };
        $("#banner-content").css('padding-top',($("#banner-container").height() - $("#banner-content").height()) / 2 + 80);
        $("#banner .graphics").css('bottom',$("#clients-bar-container").height());
    };
    
    
    /***** Our Solutions *****/
    if($("#our-solutions").length > 0){
        $('#our-solutions h3').adjustHeight();
        $('#our-solutions p').adjustHeight();
    };
    
    
    /***** Columns *****/
    if($(".content .column").length > 0){
        $(".content").each(function(){
            $content = $(this);
            $content.find('.column').each(function(){
                $column = $(this);
                if($column.find('img').length > 0){
                    $column.addClass('no-padding');
                };
                if($content.find('.no-padding').height() > $content.find('.column:not(.no-padding)').height()){
                    $content.find('.column:not(.no-padding)').css('padding-top',($content.find('.no-padding').height() - $content.find('.column:not(.no-padding)').height()) / 2);
                };
                if($(window).width() < 960){
                    $content.find('.no-padding').insertAfter($content.find('.column:not(.no-padding)'));
                };
                $column.find("> *").last().addClass('last-item');
            });
            $content.find('.center').each(function(){
                $center = $(this);
                $center.find("> *").last().addClass('last-item');
            });
        });
    };
};


$(document).ready(function(){
    /***** Resize Items *****/
    resizeItems();
    
    
    /***** Scroll Down Button *****/
    $(".scrollDown").click(function(e){
        e.preventDefault();
        $('html, body').animate({
            scrollTop: $( $.attr(this, 'href') ).offset().top
        }, 500);
    });
    
    
    $(window).scroll(function(){
        if($(window).scrollTop() > 50){
            $("#header-container").addClass('scrolled');
        } else {
            $("#header-container").removeClass('scrolled');
        };
    });
    
    
    /***** Mobile Menu *****/
    $("#menu-button").click(function(e){
        e.preventDefault();
        $this = $(this);
        if($this.hasClass('active')){
            $this.stop().removeClass('active');
            $("#mobile-nav").stop().slideUp();
            $("#mobile-menu li ul").slideUp();
            $("#mobile-menu a").removeClass('open');
        } else {
            $this.stop().addClass('active');
            $("#mobile-nav").stop().slideDown();
            $("#header-container").addClass('menu-opened');
        };
    });
    
    $("#mobile-menu li").each(function(){
        if($(this).find('ul').length > 0){
            $(this).addClass('dropdown');
        };
    });
    
    
    $("#mobile-menu > li.dropdown > a").click(function(e){
        if(!$(this).hasClass('open')){
            e.preventDefault();
            $("#mobile-menu li ul").slideUp();
            $("#mobile-menu li a").removeClass('open')
            $(this).parent().find('ul').slideDown();
            $(this).addClass('open');
        };
    });
    
    
    /***** Hide Fixed Header on Mobile *****/
    if($(window).width() < 750){
        var didScroll;
        var lastScrollTop = 0;
        var delta = 5;
        var navbarHeight = $('#header-container').outerHeight();
        
        $(window).scroll(function(event){
            didScroll = true;
        });
        
        setInterval(function() {
            if (didScroll) {
                hasScrolled();
                didScroll = false;
            }
        }, 250);
        
        function hasScrolled() {
            var st = $(this).scrollTop();
            if(Math.abs(lastScrollTop - st) <= delta)
                return;
            if (st > lastScrollTop && st > navbarHeight){
                $('#header-container').animate({top:-navbarHeight});
            } else {
                if(st + $(window).height() < $(document).height()) {
                    $('#header-container').animate({top:0});
                }
            }   
            lastScrollTop = st;
        }
    };
    
    
    /***** Page Banner *****/
    if($("#page-banner .center").length > 0){
        $("#page-banner").addClass('small-padding');
    };
});


$(window).load(function() {
    /***** Transitional Effects *****/
    setTimeout(function(){
        $("body a, body input[type='submit'], button").addClass("loaded");    
    },1000);


    /***** Resize Items *****/
    resizeItems();
    
    
    /***** Banner Graphics *****/
    if($("#banner").length > 0){
        $("#banner-container .inner").animate({width:'100%'},3000,'easeOutExpo');
    };
});

var w = $(window).width();
$(window).resize(function(){
    if ($(window).width()==w) return; 
    w = $(window).width();
    
    
    /***** Resize Items *****/
    resizeItems();
});


/***** Adjust Height Function *****/
jQuery.fn.adjustHeight = function() {
    var maxHeightFound = 0;
    this.css('min-height','1px');
    this.each(function() {
        if( $(this).height() > maxHeightFound ) {
            maxHeightFound = $(this).height();
        }
    });
    this.css('min-height',maxHeightFound);
};


/***** Show Window Size Function
$(document).ready(function(){
    var MEASUREMENTS_ID = 'measurements';
    $("body").append('<div id="'+MEASUREMENTS_ID+'"></div>');
    $("#"+MEASUREMENTS_ID).css({
        'position': 'fixed',
        'bottom': '0',
        'right': '0',
        'background-color': 'black',
        'color': 'white',
        'padding': '5px',
        'font-size': '14px',
        'opacity': '1',
        'z-index': '9999'
    });
    getDimensions = function(){
        return $(window).innerWidth() + ' (' + $(document).width() + ') x ' + $(window).innerHeight() + ' (' + $(document).height() + ')';
    }
    $("#"+MEASUREMENTS_ID).text(getDimensions());
    $(window).on("resize", function(){
        $("#"+MEASUREMENTS_ID).text(getDimensions());
    });
}); *****/