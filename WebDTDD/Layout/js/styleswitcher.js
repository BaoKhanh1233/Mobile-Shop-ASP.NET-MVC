(function($){
	"use strict";

	var lButton = $('.layout_button'),
		oButton = $('#open_switcher'),
		sw = $('#styleswitcher'),
		layout = $('[class*="_layout"]:not(.b_default_layout)'),
		sc = $('#cpicker'),
		imgBg = $('#image_background_container'),
		colorBg = $('#color_background_container'),
		footerSelect = $('#footer_select'),
		headerSelect = $('#header_select'),
		header = $('[role="banner"]'),
		footer = $('[role="contentinfo"]');

	$(function(){

		lButton.on('click',function(){
			$(this).addClass('bg_scheme_color color_white').removeClass('color_dark bg_white')
				.siblings().removeClass('bg_scheme_color color_white').addClass('color_dark bg_white');
			layout.toggleClass('wide_layout boxed_layout');
		});

		oButton.on('click',function(){
			$(this).parent().toggleClass('closed');
		});

		sc.ColorPicker({
			color: '#2c2b44',
			onShow: function (colpkr){
				$(colpkr).fadeIn(500);
				return false;
			},
			onHide: function (colpkr) {
				$(colpkr).fadeOut(500);
				return false;
			},
			onChange: function (hsb, hex, rgb){
				$('body').css('background-image','none');
				sc.add('body').css('backgroundColor', '#' + hex);
			}
		});

		sw.find('[data-bg]').each(function(){
			var $this = $(this),
				bgPath = $this.data('bg');
			$this.css('background','url('+bgPath+') left top / cover no-repeat');
		});

		sw.find('[data-bg]').on('click',function(){
			$('body').css({
				'background-image' : 'url('+$(this).data('bg')+')',
				'background-color' : 'none'
			});
		});

		$('.change_bg_select').on('click','li',function(){
			if($(this).text() === "Image"){
				colorBg.slideUp(function(){
					imgBg.slideDown();
				});
			}
			else{
				imgBg.slideUp(function(){
					colorBg.slideDown();
				});	
			}
		});

		$('#reset_switcher').on('click',function(){
			if(imgBg.length){
				imgBg.slideUp(function(){
					colorBg.slideDown();
				});	
				$('.change_bg_select').siblings('.select_title').text('Color');
			}
			sc.removeAttr('style');
			$('body').css({
				'background-color':'transparent',
				'background-image' : 'none'
			});
			layout.removeClass('boxed_layout').addClass('wide_layout');
			lButton.eq(0).addClass('bg_scheme_color color_white').removeClass('bg_white color_dark')
					.end().eq(1).removeClass('bg_scheme_color color_white').addClass('bg_white color_dark');
		});

		headerSelect.on('click','li',function(){

			var $this = $(this),
				type = $this.text();
			if($this.hasClass('active')) return false;

			header.slideUp(function(){
				switch(type){
					case "Header 1" : 
						header.load("inc/header_1.html",function(){
							$(this).slideDown(function(){
								$.stickyMenu();
								$.megaMenu();
								$this.addClass('active').siblings().removeClass('active');
								window.globalCore.events.openSearchForm();
							});
						});
					break;
					case "Header 2" : 
						header.load("inc/header_2.html",function(){
							$(this).slideDown(function(){
								$.stickyMenu();
								$.megaMenu();
								$this.addClass('active').siblings().removeClass('active');
								window.globalCore.events.openSearchForm();
							});
						});
					break;
					case "Header 3" : 
						header.load("inc/header_3.html",function(){
							$(this).slideDown(function(){
								$.stickyMenu();
								$.megaMenu();
								$this.addClass('active').siblings().removeClass('active');
								window.globalCore.events.openSearchForm();
							});
						});
					break;
					case "Header 4" : 
						header.load("inc/header_4.html",function(){
							$(this).slideDown(function(){
								$.stickyMenu();
								$.megaMenu();
								$this.addClass('active').siblings().removeClass('active');
								window.globalCore.events.openSearchForm();
							});
						});
					break;
				}
			});
		});

		footerSelect.on('click','li',function(){

			var $this = $(this),
				type = $this.text();
			if($this.hasClass('active')) return false;

			footer.slideUp(function(){
				switch(type){
					case "Footer 1" : 
						footer.load("inc/footer_1.html",function(){
							$(this).slideDown(function(){
								$this.addClass('active').siblings().removeClass('active');
							});
							if($('.tweets_list_container').length){
								$('.tweets_list_container').tweet({
									username : 'fanfbmltemplate',
									modpath: 'plugins/twitter/',
									loading_text : '<span class="fw_light">Loading tweets...</span>',
									template : '<li class="relative"><p class="fw_light lh_small"><i>{time}</i></p><p class="second_font">{text}</p></li>'
								});
								$('.tweets_list_container').find('.tweet_odd').remove();
								$('.tweets_list_container').find('.tweet_list').owlCarousel({
									items : 1,
									autoplay : true,
									loop:true,
									animateIn : "flipInX",
									animateOut : "slideOutDown",
									autoplayTimeout : 4000
								});
							}
							$('.tooltip_container').tooltip('.tooltip');
							$('html,body').animate({
								scrollTop : $(document).height()
							});
						});
					break;
					case "Footer 2" : 
						footer.load("inc/footer_2.html",function(){
							$(this).slideDown(function(){
								$this.addClass('active').siblings().removeClass('active');
							});
							$('.tooltip_container').tooltip('.tooltip');
							$('html,body').animate({
								scrollTop : $(document).height()
							});
						});
					break;
					case "Footer 3" : 
						footer.load("inc/footer_3.html",function(){
							$(this).slideDown(function(){
								$this.addClass('active').siblings().removeClass('active');
							});
							if($('.tweets_list_container').length){
								$('.tweets_list_container').tweet({
									username : 'fanfbmltemplate',
									modpath: 'plugins/twitter/',
									loading_text : '<span class="fw_light">Loading tweets...</span>',
									template : '<li class="relative"><p class="fw_light lh_small"><i>{time}</i></p><p class="second_font">{text}</p></li>'
								});
								$('.tweets_list_container').find('.tweet_odd').remove();
								$('.tweets_list_container').find('.tweet_list').owlCarousel({
									items : 1,
									autoplay : true,
									loop:true,
									animateIn : "flipInX",
									animateOut : "slideOutDown",
									autoplayTimeout : 4000
								});
							}
							$('.tooltip_container').tooltip('.tooltip');
							$('html,body').animate({
								scrollTop : $(document).height()
							});
						});
					break;
					case "Footer 4" : 
						footer.load("inc/footer_4.html",function(){
							$(this).slideDown(function(){
								$this.addClass('active').siblings().removeClass('active');
							});
							window.globalCore.flickr();
							$('html,body').animate({
								scrollTop : $(document).height()
							});
						});
					break;
				}
			});
		});

	});

	$(window).on('load',function(){
		setTimeout(function(){
			sw.addClass('closed');
		},1000);
	});

	

})(jQuery);