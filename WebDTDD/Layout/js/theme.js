(function($){
	"use strict";

	var Core = {

		initialized : false,

		initialize : function(pageLoad){
			if(this.initialized) return;

			if(pageLoad == "DOM"){
				this.buildAfterDomReady();
			}
			else if(pageLoad == "images"){
				this.buildAfterWindowLoad();
				this.initialized = true;
			}
		},

		buildAfterDomReady : function(){
			this.plugins();
			this.flickr();
			$.responsiveMenu();
			$.backToTop(100,'bounceInRight','bounceOutRight');
			$.animatedContent();
			$.styledSelect();
			$.oldBrowsersPlaceholder();
			$.fullWidthMasonry();
			$.scrollSidebar();
			this.events.categories();
			this.sliders();
			this.events.openDropdown();
			this.events.ratingList();
			this.events.openSearchForm();
			this.owlCarousel();
			this.simpleSlideshow();
			this.events.contactForm();
			this.events.newsletter();
			this.events.quantity();
			this.events.reset();
			this.events.isotopeChangeLayout();
		},

		buildAfterWindowLoad : function(){
			$.stickyMenu();
			$.megaMenu();
			this.isotope();
			this.events.progressBar();
			$.correctResponsiveImagesPosition();
			this.events.popupButtons();
			this.pluginsWLOAD();
			this.events.offer();
			$.counters();
		},

		events : {

			openDropdown : function(){

				$.openDropdown();

				// close button

				$('[class*="_layout"]').on('click','[class*="close"],.alert_box i[class^="fa "]',function(){
					$(this).parent().animate({
						'opacity': 0
					},function(){
						$(this).slideUp();
					});
				});

			},

			ratingList : function(){
				var fp = $('.rating_list');
				fp.on('click','li',function(){
					var self = $(this);
					self.siblings().removeClass('color_lbrown');
					self.addClass('color_lbrown').prevAll().addClass('color_lbrown');
				});
			},

			openSearchForm : function(){
				var form = $('[role="search"]'),
					field = form.children('input[type="text"]');

				if(!field.hasClass('hidden')) return false;



				form.on("mouseenter mouseleave",function(event){
					if($(window).width() < 767) return false;
					$(this).stop().animate({
						"width" : event.type === "mouseenter" ? 242 : 40
					}).children('input[type="text"]').toggleClass('hidden');

					if(event.type === "mouseleave"){
						$(this).children('input[type="text"]').trigger("blur");
					}
				});
			},

			progressBar : function(){

				var skill = $('[data-progress]');

				skill.each(function(){
					var $this = $(this),
						percent = $this.data('progress'),
						offset = $this.offset().top - 850;

					$(window).on("scroll",function(){

						if($this.children().width() > 0) return false;

						if($(window).scrollTop() >= offset){
							$this.children().stop().animate({
								width : percent + "%"
							});
							return false;
						}
					});

				});

			},

			popupButtons : function(){

				var ulWithButtons = $('.open_buttons_container:not(.in_masonry)');

				ulWithButtons.each(function(){
					var $this = $(this);
					$this.css({
						'margin-left' : $this.outerWidth() / -2,
						'margin-top' : $this.outerHeight() / -2
					});
				});

			},

			categories : function(){
				var list = $('.categories_list');

				list.on('click','.open_sub_categories',function(){
					var $this = $(this);

					if(!$this.next('ul').length) return false;

					$this.toggleClass('active').prev("a").toggleClass("fw_bold").siblings("ul").stop().slideToggle();
					$this.prev('a').toggleClass('scheme_color bg_grey_light_2');
				});
			},

			sortIsotope : function(container){
				$('.sort').on('click','[data-filter]',function(e){
					var self = $(this),
					selector = self.attr('data-filter');
				  	// self.closest('li').addClass('active').siblings().removeClass('active');
				  	container.isotope({ filter: selector });
				  	e.preventDefault();
				});
			},

			contactForm : function(){

				var cf = $('#contactform');
				cf.append('<div class="message_container d_none m_top_20"></div>');
				var message = cf.children('.message_container');

				cf.on("submit",function(event){
					event.preventDefault();
					if(message.hasClass('opened')) return;
					var self = $(this),text;

					var request = $.ajax({
						url:"php/mail.php",
						type : "post",
						data : self.serialize()
					});

					request.then(function(data){
						if(data == "1"){
							message.addClass('opened');
							text = "Your message has been sent successfully!";

							cf.find('input:not([type="submit"]),textarea').val('');

							$('.message_container').html('<div class="alert_box r_corners color_green success"><p>'+text+'</p></div>')
								.delay(150)
								.slideDown(300)
								.delay(4000)
								.slideUp(300,function(){
									$(this).html("");
									message.removeClass('opened');
								});

						}
						else{
							message.addClass('opened');
							if(cf.find('textarea').val().length < 20){
								text = "Message must contain at least 20 characters!"
							}
							if(cf.find('input').val() == ""){
								text = "All required fields must be filled!";
							}
							$('.message_container').html('<div class="alert_box error relative m_bottom_10 fw_light"><p>'+text+'</p></div>')
								.delay(150)
								.slideDown(300)
								.delay(4000)
								.slideUp(300,function(){
									$(this).html("");
									message.removeClass('opened');
								});
						}
					},function(){
						message.addClass('opened');
						$('.message_container').html('<div class="alert_box error relative m_bottom_10 fw_light"><p>Connection to server failed!</p></div>')
								.delay(150)
								.slideDown(300)
								.delay(4000)
								.slideUp(300,function(){
									$(this).html("");
									message.removeClass('opened');
								});
					});
				});

			},

			newsletter : function(){
				var subscribe = $('.newsletter');

				subscribe.each(function(){
					var $this = $(this);
					$this.append('<div class="message_container_subscribe d_none m_top_20"></div>');
					var message = $this.find('.message_container_subscribe'),text;

					$this.on('submit',function(e){
						e.preventDefault();
						if(message.hasClass('opened')) return;
						
						if($this.find('input[type="email"]').val() == ''){
							message.addClass('opened');
							text = "Please enter your e-mail!";
							message.html('<div class="alert_box error relative m_bottom_10 fw_light"><p>'+text+'</p></div>')
								.slideDown()
								.delay(4000)
								.slideUp(function(){
									$(this).html("");
									message.removeClass('opened');
								});

						}else{
							$this.find('span.error').hide();
							$.ajax({
								type: "POST",
								url: "php/newsletter.php",
								data: $this.serialize(),
								success: function(data){
									if(data == '1'){
										message.addClass('opened');
										text = "Your email has been sent successfully!";
										message.html('<div class="alert_box r_corners color_green success"><p>'+text+'</p></div>')
											.slideDown()
											.delay(4000)
											.slideUp(function(){
												$(this).html("");
												message.removeClass('opened');
											})
											.prevAll('input[type="email"]').val("");
									}else{
										message.addClass('opened');
										text = "Invalid email address!";
										message.html('<div class="alert_box error relative m_bottom_10 fw_light"><p>'+text+'</p></div>')
											.slideDown()
											.delay(4000)
											.slideUp(function(){
												$(this).html("");
												message.removeClass('opened');
											});
									}
								}
							});
						}
					});

				});
			},

			quantity : function(){

				var q = $('.quantity');

				q.each(function(){
					var $this = $(this),
						button = $this.children('button'),
						input = $this.children('input[type="text"]'),
						val = +input.val();

					button.on('click',function(){
						if($(this).hasClass('minus')){
							if(val === 1) return false;
							input.val(--val);
						}
						else{
							input.val(++val);
						}
					});
				});

			},

			// offer

			offer : function(){

				$('.offer_container').each(function(){

					var $this = $(this),
						offer = $this.find('.offer');

					$this.on('mouseenter mouseleave',function(){
						offer.toggleClass('hidden visible');
					});

					$this.on('mousemove',function(event){

						var left = $this.offset().left,
							top = $this.offset().top;

						offer.css({
							top : Math.abs(top - event.pageY - 20),
							left : Math.abs(left - event.pageX - 20)
						});

					});

				});

			},

			reset : function(){

				$('.filter_reset').on('click',function(){
					var range = $(this).closest('form').find('.range_slider'),
						data = range.data();

					range.slider('option','values', [data.firstValue, data.secondValue]);

					setTimeout(function(){
						range.next().children('.range_min').val("$" + data.firstValue)
							.next().val("$" + data.secondValue);
					},0);

				});

			},

			isotopeChangeLayout : function(){

				var button = $('[data-isotope-container]');

				button.each(function(){

					var $this = $(this),
						container = $($this.data('isotope-container')),
						layout = $this.data('isotope-layout');

					$this.on('click',function(){

						$(this).addClass('black_button_active').siblings().removeClass('black_button_active').addClass('black_hover');

						if(layout == "list"){
							container.children("[class*='isotope_item']").addClass('list_view_type');
							container.removeClass('m_bottom_20').addClass('m_bottom_10');
						}
						else{
							container.children("[class*='isotope_item']").removeClass('list_view_type');
							container.addClass('m_bottom_20').removeClass('m_bottom_10');
							$.correctResponsiveImagesPosition();
						}

						container.isotope('layout');

						container.find('.tooltip_container').tooltip('.tooltip').tooltip('.tooltip');

					});



				});

			}

		},

		sliders : function(){

			var slidersArray = ['.layerslider','.layerslider_video','.royalslider','.r_slider','.flexslider'];

			// layerslider 

			if($(slidersArray[0]).length){
				$(slidersArray[0]).layerSlider({
					responsiveUnder : 1140,
					layersContainer : 1140,
					navStartStop : false,
					showBarTimer : false,
					showCircleTimer : false,
					skinsPath : './plugins/layerslider/skins/',
					skin : 'defaultskin',
					cbInit : function(){
						$(slidersArray[0]).find('.ls-nav-prev').append('<i class="fa fa-angle-left"></i>').end().
							find('.ls-nav-next').append('<i class="fa fa-angle-right"></i>');
					}
				});
			}

			// video slider (layer)

			if($(slidersArray[1]).length){
				$(slidersArray[1]).layerSlider({
					pauseOnHover:false,
					responsive:true,
					responsiveUnder:1170,
					layersContainer : 1170,
					animateFirstSlide:false,
					twoWaySlideshow:true,
					skinsPath:'plugins/layerslider/skins/',
					skin:'borderlessdark',
					globalBGColor:'transparent',
					navPrevNext : true,
					hoverPrevNext : false,
					navStartStop:false,
					navButtons:false,
					showCircleTimer:false,
					thumbnailNavigation:'disabled',
					lazyLoad:false,
					cbInit : function(){
 						$(slidersArray[1]).find('.ls-nav-next').addClass('button_type_11 black_hover grey state_2 t_align_c vc_child d_block tr_all')
 							.append('<i class="fa fa-angle-right d_inline_m"></i>').end()
 						.find('.ls-nav-prev').addClass('button_type_11 black_hover grey state_2 t_align_c vc_child d_block tr_all')
 											.append('<i class="fa fa-angle-left d_inline_m"></i>');

 					}
				});
			}

			// royal slider

			if($(slidersArray[2]).length){
				$(slidersArray[2]).royalSlider({
		            keyboardNavEnabled: true,
		            autoScaleSlider : true,
		            imageScaleMode : 'fill',
		            slidesSpacing : 0,
		            transitionSpeed : 500,
		            fadeinLoadedSlide : false,
		            loop : true
		        });
		        var slider = $(slidersArray[2]).data('royalSlider');

				slider.slides[0].holder.on('rsAfterContentSet', function(e, slideObject) {
				    $(slidersArray[2]).find('.rsArrowLeft').append('<i class="fa fa-angle-left"></i>').end()
				    	.find('.rsArrowRight').append('<i class="fa fa-angle-right"></i>');
				});
			}

			// revolution slider

			if($(slidersArray[3]).length){
				var api = $(slidersArray[3]).revolution({
					delay:5000,
					startwidth:1170,
					startheight:570,
					hideThumbs:0,
					fullWidth:"on",
		     		hideTimerBar:"on",
		     		soloArrowRightHOffset:20,
		     		soloArrowLeftHOffset:20,
		     		navigationVOffset : 15,
		     		shadow:0
				});
				api.bind('revolution.slide.onloaded',function(){
	      		$(slidersArray[3]).parent().find('.tp-leftarrow').append('<i class="fa fa-angle-left"></i>').end()
				    	.find('.tp-rightarrow').append('<i class="fa fa-angle-right"></i>');
	      		});
			}

			// flexslider

			if($(slidersArray[4]).length){
				$(slidersArray[4]).flexslider({
					animation : "fade",
					animationSpeed : 500,
					prevText: '<i class="fa fa-angle-left"></i>',
					nextText: '<i class="fa fa-angle-right"></i>'
				});
			}
		},

		pluginsWLOAD : function(){
			var pluginsArray = ['.tooltip_container','.sh_container'];

			// tooltip container

			if($(pluginsArray[0]).length){
				$(pluginsArray[0]).tooltip('.tooltip');
			}

			// same height

			if($(pluginsArray[1]).length){
				$(pluginsArray[1]).sameHeight();
			}
		},

		plugins : function(){
			var pluginsArray = ['.tabs',
								'.tweets_list_container',
								'[data-popup]',
								'.accordion:not(.toggle)',
								'.toggle',
								'.jackbox[data-group]',
								'.countdown',
								'.range_slider',
								'#zoom'];

			// tabs

			if($(pluginsArray[0]).length){
				$(pluginsArray[0]).easytabs({
					tabActiveClass : 'color_dark',
					tabs : '> nav > ul > li',
					updateHash : false
				}).bind('easytabs:after', function() {
				    $(pluginsArray[0]).find('.tooltip_container').tooltip('.tooltip').tooltip('.tooltip');
				});
			}

			// twitter

			if($(pluginsArray[1]).length){
				$(pluginsArray[1]).tweet({
					username : 'fanfbmltemplate',
					modpath: 'plugins/twitter/',
					loading_text : '<span class="fw_light">Loading tweets...</span>',
					template : '<li class="relative"><p class="fw_light lh_small"><i>{time}</i></p><p class="second_font">{text}</p></li>'
				});
				$(pluginsArray[1]).find('.tweet_odd').remove();
				$(pluginsArray[1]).find('.tweet_list').owlCarousel({
					items : 1,
					autoplay : true,
					loop:true,
					animateIn : "flipInX",
					animateOut : "slideOutDown",
					autoplayTimeout : 4000
				});
			}

			// popup init

			if($(pluginsArray[2]).length){
				$(pluginsArray[2]).popup({
					afterOpen : function(){
						if($(this).find('.tooltip_container').length){
							$(this).find('.tooltip_container').tooltip('.tooltip').tooltip('.tooltip');
						}
						$('.addthis_button_compact').off('mouseenter.top').off('mousemove.top').on('mouseenter.top mousemove.top',function(){
							var $this = $(this);
							setTimeout(function(){$('#at15s').css('top',$this.offset().top + 34)},4);
						});
					}
				});
			}

			// accordion

			if($(pluginsArray[3]).length){
				$(pluginsArray[3]).accordion();
			}

			// toggle

			if($(pluginsArray[4]).length){
				$(pluginsArray[4]).accordion(450,true);
			}

			// jackbox

			if($(pluginsArray[5]).length){
				$(pluginsArray[5]).jackBox("init",{
					baseName: "plugins/jackbox"
				});
			}

			// countdown

			if($(pluginsArray[6]).length){

				$(pluginsArray[6]).each(function(){

					var $this = $(this),
						dateObj = $this.data();

					var finalDate = new Date(dateObj.year, dateObj.month, dateObj.day, dateObj.hours, dateObj.minutes);

					$this.countdown({
						until : finalDate,
						layout : '<b>{dn}</b> <span class="fs_medium d_inline_b m_right_5">days</span> <b>{hn}</b> <span class="fs_medium d_inline_b m_right_5">hrs</span> <b>{mn}</b> <span class="fs_medium d_inline_b m_right_5">min</span> <b>{sn}</b> <span class="fs_medium">sec</span>'
					});

				});

				
			}

			// range slider

			if($(pluginsArray[7]).length){
				$(pluginsArray[7]).slider({
					range : true,
					min : 0,
					max : 5400,
					values : [0,5250],
					slide : function(event, ui){
						$(this).next().children('.range_min').val("$" + ui.values[0])
								.next().val("$" + ui.values[1]);
					},
					create : function(event, ui){
						var $this = $(this);
						$this.next().children('.range_min').val("$" + $this.slider("values",0))
								.next().val("$" + $this.slider("values",1));
						$this.attr({
							'data-first-value' : $this.slider("values",0),
							'data-second-value' : $this.slider("values",1)
						});
					}
				});
			}

			// elevate zoom

			if($(pluginsArray[8]).length){
				$(pluginsArray[8]).elevateZoom({
					zoomType: "inner",
					gallery:'thumbnails',
					galleryActiveClass: 'active',
					cursor: "crosshair",
					responsive:true,
					easing:true,
					zoomWindowFadeIn: 500,
					zoomWindowFadeOut: 500,
					lensFadeIn: 500,
					lensFadeOut: 500
				});
				$("#zoom").on("click", function(e) { 
					var ez = $(this).data('elevateZoom'),
						items = ez.getGalleryList();

					items.shift();
					$.fancybox(items);
					e.preventDefault();
				});
			}

		},

		owlCarousel : function(){

			$('.owl-carousel').each(function(){

				var _this = $(this),
					options = _this.data('owl-carousel-options') ? _this.data('owl-carousel-options') : {},
					buttons = _this.data('nav'),
					config = $.extend(options,{
						dragEndSpeed : 500,
						smartSpeed : 500
					});
					
				var owl = _this.owlCarousel(config);

				$('.' + buttons + 'prev').on('click',function(){
					owl.trigger('prev.owl.carousel');
				});
				$('.' + buttons + 'next').on('click',function(){
					owl.trigger('next.owl.carousel');
				});

			});
		},

		flickr : function(){

			// flickr 
	
			var flickr = $('.flickr_list');

			flickr.each(function(){

				var self = $(this),
					options = self.data('flickr-options'),config,defaults,
					group = self.data('flickr-group'),
					counter = 1;

				defaults = {
					flickrbase:'http://api.flickr.com/services/feeds/',
					feedapi:'photos_public.gne',
					limit: 6,
					qstrings:{lang:'en-us',format:'json',jsoncallback:'?'},
					cleanDescription:true,
					useTemplate:true,
					itemTemplate: '<li class="f_left r_corners m_right_5 m_left_5 m_bottom_10 tr_all"><a data-group="'+group+'" data-title="{{title}}" href="{{image}}" class="jackbox d_block frame_container mini"><img alt="" width="80" height="80" src="{{image_s}}"/></a></li>',
					itemCallback:function(){
						counter++;
						// if(counter == defaults.limit) $('.jackbox.temporary').eq(0).jackBox('removeItem');
					}
				}

				config = $.extend({}, defaults, options);

				self.jflickrfeed(config,function(data){
					self.find('.jackbox[data-group='+group+']').jackBox("newItem", {
				        group: group
				    });
				});


			});

		},

		isotope : function(){

			var cthis = this;
			$('[data-isotope-options]').each(function(){

				var self = $(this),
					options = self.data('isotope-options');

				var isotope = self.isotope(options);

				isotope.isotope('layout');

				cthis.events.sortIsotope(self);	

			});

		},

		simpleSlideshow : function(){

			var slideshow = $('.simple_slideshow');
			if(!slideshow.length) return false;

			slideshow.each(function(){

				var $this = $(this),
					options = $this.data('flexslider-options'),
					all = {
						animationSpeed : 500,
						slideshow : false,
						controlNav : false,
						prevText : "",
						nextText : "",
						start : function(){
							var p = $this.find('.flex-prev'),
								n = $this.find('.flex-next');
							p.append('<i class="fa fa-angle-left d_inline_m"></i>');
							n.append('<i class="fa fa-angle-right d_inline_m"></i>');
							p.add(n).addClass('b_none button_type_11 grey state_2 t_align_c vc_child d_block tr_all');
						}
					},
					config = $.extend({}, $.flexslider.defaults , all,  options);

				slideshow.flexslider(config);

			});

		}

	}

	window.globalCore = Core;

	//DOM ready

	$(function(){
		Core.initialize("DOM");
		$(window).afterResize(function(){
			$.correctResponsiveImagesPosition();	
			$.megaMenu();
		});
	});


	// after all images been loaded

	$(window).load(function(){
		Core.initialize('images');
	});

	$(window).on('load',function(){
		$('#preloader').fadeOut(1000,function(){
			// page loaded
			$('[data-popup="#subscribe_popup"]').trigger('click');
		});
	});

})(jQuery);