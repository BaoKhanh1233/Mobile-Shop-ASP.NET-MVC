(function($){
	"use strict";

	$.extend({

		stickyMenu : function(){

			if(!($('body').hasClass('sticky_menu'))) return false;
			

			var sticky = new Object(),
				header = $('[role="banner"]'),
				hSticky = $('.header_bottom_part'),
				hHeight = hSticky.height() + +hSticky.css('paddingBottom').slice(0,-2),
				offset = hSticky.offset().top,
				body = $('body');

			sticky.init = function(){
				$(window).on('scroll',sticky.checkSticky);
				sticky.checkSticky();
			}
			sticky.checkSticky = function(){
				if(!(body.hasClass('sticky_menu'))) return false;

				if($(window).width() < 768){
					sticky.stickyDeactivate();
					hSticky.removeClass('fixed');
					header.removeAttr('style');
					return false;
				}

				if($(window).scrollTop() > offset){
					sticky.stickyActivate();
				}
				else{
					sticky.stickyDeactivate();
				}
			}
			sticky.stickyActivate = function(){
				if(hSticky.hasClass('fixed')) return;
				hSticky.addClass('fixed');
				header.css('padding-bottom',hHeight);
			}
			sticky.stickyDeactivate = function(){
				if(!hSticky.hasClass('fixed')) return;
				hSticky.removeClass('fixed');
				header.removeAttr('style');
			}
			sticky.init();
		},

		responsiveMenu : function(){

			var menu = $('.main_menu'),
				header = $('[role="banner"]'),
				nav = {

					init : function(){
						this.scrollWidth = this.checkScrollWidth();
						this.checkWindowSize();
						$(window).on('resize', {self: this}, this.checkWindowSize);
						this.displayStyle = menu.parent().css('display');
						this.windowWidth = $(window).width();
					},

					checkScrollWidth : function(){

						var element = document.createElement("div");
						element.className = "detect_scroll_width";
						document.body.appendChild(element);
						return element.offsetWidth - element.clientWidth;

					},

					checkWindowSize : function(event){

						if(event){
							var self = event.data.self;
							if($(window).width() == self.windowWidth) return;
						}

						if($(window).width() + nav.scrollWidth < 768){
							nav.Activate();
							menu.find('.touch_open_sub,.current_click').removeClass('touch_open_sub current_click').children('a').removeClass('prevented');
						}
						else if($(window).width() + nav.scrollWidth  > 767){
							nav.Deactivate();
						}

					},
					// add click events
					Activate : function(){

						this.windowWidth = $(window).width();

						if($('html').hasClass('md_touch')) header.off('.touch');
						header.off('.responsivemenub').off('.responsivemenu');

						header.on('click.responsivemenub','#mobile_menu_button',nav.openClose);

						header.on('click.responsivemenu','.main_menu li a',nav.openCloseSubMenu);

						$('#mobile_menu_button').removeClass('bg_transparent color_lbrown').addClass('bg_lbrown color_white');

						$('.main_menu .sub_menu,.main_menu .mega_menu').hide();

						menu.parent().hide().find('.touch_open_sub').removeClass('touch_open_sub').children('a').removeClass('prevented');

					},
					// remove click events
					Deactivate : function(){

						header.off('.responsivemenu').off('.responsivemenub').off('.touch');

						menu.parent().show().find('li').removeClass('current_click')
							.end().find('.sub_menu,.mega_menu').show().end().find('.prevented').removeClass('prevented').end()
							.find('.touch_open_sub').removeClass('touch_open_sub');

						$('#mobile_menu_button').removeClass('bg_transparent color_lbrown').addClass('bg_lbrown color_white');

						if($('html').hasClass('md_touch')) header.on('click.touch','.main_menu li a',nav.touchOpenSubMenu);

					},

					openClose : function(){

						$(this).toggleClass('color_lbrown color_white bg_lbrown bg_transparent');
						menu.parent('nav').stop().slideToggle();

					},

					openCloseSubMenu : function(e){

						var self = $(this);

						if(self.next('.sub_menu').length || self.next('.mega_menu').length){
							self.parent()
								.addClass('current_click')
								.siblings()
								.removeClass('current_click')
								.children(':not(a)')
								.slideUp();
							self.next().stop().slideToggle();
							self.parent().siblings().children('a').removeClass('prevented');

							if(!(self.hasClass('prevented'))){
								e.preventDefault();
								self.addClass('prevented');
							}else{
								self.removeClass('prevented');
							}
						}

					},

					touchOpenSubMenu : function(event){
						var self = $(this);

						if(self.next('.sub_menu').length || self.next('.mega_menu').length){

							if(!(self.hasClass('prevented'))){
								event.preventDefault();
								self.addClass('prevented');
							}else{
								self.removeClass('prevented');
							}

							$(this).parent().toggleClass('touch_open_sub').siblings().removeClass('touch_open_sub').children('a').removeClass('prevented')
								.parent().find('.touch_open_sub').removeClass('touch_open_sub').children('a').removeClass('prevented');

						}
						
					}

				}

			nav.init();

		},

		megaMenu : function(){

			var container = $('.mega_menu'),
				OFFSETS = 36,
				mMenuWidth = container.closest('.main_menu').outerWidth() + OFFSETS;

			container.each(function(){

				var $this = $(this),
					pos = $this.closest('li').position().left + OFFSETS / 2;

				$this.css({
					'left': -pos,
					'width' : mMenuWidth
				});

			});

		},

		backToTop : function(offsetTop,show,hide){

			var button = $('.back_to_top'),
				backToTop = new Object(),
				offsetTop = offsetTop || 1000;

			backToTop.init = function(){
				backToTop.positionButton();
				$(window).on('scroll',backToTop.checkOffset).on('resize',backToTop.positionButton);
				button.on('click',backToTop.clickEvent);
			}

			backToTop.positionButton = function(){
				var offset = $('.container').offset().left + $('.container').outerWidth() + 60;
				button.css('left',offset);
			}

			backToTop.checkOffset = function(){

				if($(window).scrollTop() > offsetTop){
					button.addClass(show + ' visible');
				}
				else{
					if(!button.hasClass(show)) return;
					button.removeClass(show).addClass(hide).one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend',function(){
						$(this).removeClass(hide + ' visible');
					});
				}
			}
			backToTop.clickEvent = function(){
				$('html,body').animate({
					scrollTop : 0
				},500);
			}

			backToTop.init();
		},

		animatedContent : function(){

			$("[data-animation]").each(function() {

				var self = $(this);

				// self.addClass("hidden animated");

				if($(window).width() > 767) {
					self.appear(function() {

						var delay = (self.attr("data-animation-delay") ? self.attr("data-animation-delay") : 1);

						if(delay > 1) self.css("animation-delay", delay + "ms");
						self.removeClass('hidden').addClass("visible " + self.attr("data-animation"));

						// setTimeout(function() {
						// 	self.addClass("visible");
						// }, delay);

					}, {accX: 0, accY: -230});
				} else {
					self.removeClass("hidden").addClass("visible");
				}
			});

		},

		correctResponsiveImagesPosition : function(){

			var container = $('.r_image_container');

			container.add(container.find('img')).removeAttr('style');
			container.each(function(){
				var self = $(this),
					img = self.find('img');

				if(self.parent().hasClass('list_view_type')){
					self.css('width','auto');
					if($('[class*="isotope_container"]').length){
						$('[class*="isotope_container"]').isotope('layout');
					}
					return false;
				}

				if(img.width() < self.width() && !self.parent().hasClass('list_view_type')){
					self.css('width',img.width());		
				}
				else{
					self.css('width','auto');	
				}
			});

		},

		styledSelect : function(){

			$('.styled_select').each(function(){

				var $this = $(this),
					list = $this.children('.options_list').removeClass('d_none'),
					title = $this.children('.select_title').removeClass('d_none'),
					options = $this.children('select').children('option'),
					// for isotope
					filter = options.data("filter"),
					len = options.length,
					transitionIn = $this.data('transitionIn'),
					transitionOut = $this.data('transitionOut');

					options.parent().hide();

					for(var i = 0; i < len; i++){
						list.append('<li class="tr_delay color_dark sc_hover">'+options.eq(i).val()+'</li>');
					}

					if(filter){
						options.each(function(i){
							list.children().eq(i).attr('data-filter',$(this).data('filter'));
						});
					}

					title.add(list.children('li')).on('click',function(){
						list.toggleClass('active visible hidden');
						title.toggleClass('active');
						if(list.parent().hasClass('active')){
							setTimeout(function(){
								list.parent().removeClass('active');
								return false;
							},400); // delay should be equal duration in class .tr_all
						}
						list.parent().addClass('active');
					});

					list.on('click','li',function(){
						var val = $(this).text();
						options.parent().val(val);
						title.text(val);
					});

			});

		},

		oldBrowsersPlaceholder : function(){
			$('.md_no-cssanimations [placeholder]').each(function(){

				var self = $(this),
					ph = self.attr('placeholder');

				self.val(ph);

				self.on('focus',function(){
					if($(this).val() == ph){
						$(this).val("");
					}
				}).on('blur',function(){
					if($(this).val() == ""){
						$(this).val(ph);
					}
				});

			});
		},

		fullWidthMasonry : function(){

			var WIDTH = 360, // column width
				container = $('.full_width_masonry'),

			masonry = {

				init : function(){

					container.children().children().css('width','100%');
					this.itemsPosition();
					$(window).on('resize',this.itemsPosition);

				},
				itemsPosition : function(){

					var firefox = navigator.userAgent.toLowerCase().indexOf('firefox') > -1;

					var wWidth = container.width(),
						amount = wWidth % WIDTH > 45 ? Math.ceil(wWidth / WIDTH) : Math.floor(wWidth / WIDTH);
					container.children().css('width', (firefox ? (100 / amount).toString().substring(0,4) : 100 / amount) + '%');

				}

			}
			masonry.init();
		},

		scrollSidebar : function(){

			var self = $('aside.scrolled'),
				aHeight = self.outerHeight(),
				sticky = $('.header_bottom_part');

			if(!self.length) return false;

			var core = new Object();

			core.init = function(){

				core.checkScrollPage();
				$(window).on('scroll',core.checkScrollPage);

			}

			core.checkScrollPage = function(){
				var windowPos = $(window).scrollTop(),
					stickyHeight = sticky.outerHeight(),
					containerPos = self.parent().offset().top + self.parent().outerHeight() - aHeight - stickyHeight,
					pos = self.parent().offset().top - stickyHeight;
				if(windowPos >= containerPos) return false;
				if(windowPos >= pos){
					self.css({'position':'absolute',right:0});
					self.stop().animate({
						top : (windowPos-pos + 20) + 'px'
					});
				}
				else if(windowPos < pos) {
					self.stop().animate({
						top : 0 
					},function(){
						$(this).removeAttr('style');
					});
				}
			}

			core.init();

			return self;
			
		},

		counters : function(){

			var counter = $('[data-counter]');

			counter.each(function(){

				var $this = $(this),
					offset = $this.offset().top - 850,
					val = $this.data('counter'),
					output = $this.find('.counter_output');

				$(window).on('scroll',function(){

					if($this.hasClass('counted')) return false;

					if($(this).scrollTop() >= offset){
						$this.addClass('counted');

						var counting = setInterval(function(){
							var t = +output.text();
							t++;
							output.text(t);
							if(t == val) clearInterval(counting);

						},4);
						
					}

				});

			});

		},
		openDropdown : function(){

			$('[role="banner"]').on('click.opendropdown','[data-open-dropdown]', function(){

				var _this = $(this),
					dropdown = $(_this.data('open-dropdown')),
					showClass = dropdown.data('show'),
					hideClass = dropdown.data('hide');

				_this.toggleClass('active');

				if(dropdown.hasClass(showClass)){
					dropdown.removeClass(showClass).addClass(hideClass);
					setTimeout(function(){
						dropdown.removeClass(hideClass + ' visible');
					},500);
				}
				else{
					dropdown.addClass(showClass + ' visible');
				}
				
			});

		}

	});

	$.fn.extend({

		accordion : function(speed,useToggle){

			var speed = speed ? speed : $.fx.speed;

			return this.each(function(){
				var _self = $(this),
					link = _self.children('dt'),
					definition = _self.children('dd');

				link.not('.color_dark').next('dd').hide();

				link.on('click',function(){
					var _self = $(this);
					if(useToggle){
						_self.toggleClass('color_dark border_light_3 color_light').next('dd').stop().slideToggle(speed);
					}
					else{
						_self.removeClass('border_light_3 color_light').addClass('color_dark').next('dd').stop().slideDown(speed).siblings('dd')
						.stop().slideUp(speed).siblings('dt').not(_self).removeClass('color_dark').addClass('border_light_3 color_light');
					}

				});
			});

		},

		tooltip : function(element){

			return this.each(function(){

				var _this = $(this),
					tooltip = _this.children(element),
					showClass = tooltip.data('show'),
					hideClass = tooltip.data('hide'),
					w = tooltip.outerWidth() / -2,
					h = tooltip.outerHeight() / -2;

				if(tooltip.hasClass('top') || tooltip.hasClass('bottom')) tooltip.css('margin-left',w);
				else if(tooltip.hasClass('left') || tooltip.hasClass('right')) tooltip.css('margin-top',h);

				if($('html').hasClass('md_no-cssanimations')){return false;}

				_this.on('mouseenter mouseleave', function(){

					if(tooltip.hasClass(showClass)){
						tooltip.removeClass(showClass).addClass(hideClass).one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend',function(){
							if(!tooltip.hasClass(showClass)) $(this).removeClass(hideClass + ' visible');
						});
					}
					else if(tooltip.hasClass(hideClass)){
						tooltip.removeClass(hideClass).addClass(showClass + ' visible');
					}
					else{
						tooltip.addClass(showClass + ' visible');
					}
					
				});

			});

		},

		sameHeight : function(){

			var _this = this;

			_this.each(function(){

				var $this = $(this),
					child = $this.children('.same_height'),
					len = child.length;

				var sameHeight = {

					init : function(){
						this.checkMaxHeight();
						$(window).on('resize',this.checkMaxHeight);
					},

					checkMaxHeight : function(){

						child.css('height','auto');
						

						if($(window).width() < 768) return false;
						var max = 0;

						for(var i = 0;i < len;i++){
							if(child.eq(i).outerHeight() > max) max = child.eq(i).outerHeight();
						}

						child.css('height',max);
					}

				}

				sameHeight.init();

			});

			

			return _this;

		},

		popup : function(options){

			return this.each(function(){
				var $this = $(this),
					transitionIn = $this.data('popup-transition-in'),
					transitionOut = $this.data('popup-transition-out');

				var Popup = {

					init : function(){
						$.extend(this.config,options);
						this.popupElem = $this.data('popup');
						this.childElem = $(this.popupElem).children('.popup');

						this.initPopupWindow();
						this.addEvent();
						this.detectScrollBarWidth();
					},

					config : {
						speed : 500,
						afterOpen : function(){},
						afterClose : function(){}
					},

					initPopupWindow : function(){
						var wrap = $(this.popupElem);
						if(transitionIn) wrap.children('.popup').addClass('animated');
					},

					initChildWindow : function(){
						var elem = $(this.childElem);

						elem.css({
							'marginLeft' : elem.outerWidth() / -2,
							'marginTop' : elem.outerHeight() / -2
						});
					},

					addEvent : function(){
						var mainObj = this,
							pP = this.popupElem;

						$this.on('click',{p: pP, object: mainObj},this.openPopup);
						$(pP).on('click',function(event){
							if($(event.target).attr('id') == $(pP).attr('id')) mainObj.closePopup();
						});
						$(pP).find('.close_popup').on('click',function(){
							mainObj.closePopup();
						});
					},

					openPopup : function(event){
						if($(window).width() < 768) return false;
						var p = $(event.data.p),
							obj = event.data.object;
						p.fadeIn(obj.config.speed,function(){
							if(!transitionIn){
								obj.config.afterOpen();
							}
						});
						obj.initChildWindow();
						if(transitionIn){
							setTimeout(function(){
								p.children('.popup').addClass(transitionIn)
								.one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend',obj.config.afterOpen);	
							},10);
						}
						obj.disableScroll();
					},

					closePopup : function(){
						var obj = this,
							delay = 0;
						if(transitionOut){
							$(obj.popupElem).children('.popup').removeClass(transitionIn).addClass(transitionOut);
							delay = 300;
						}
						setTimeout(function(){
							$(obj.popupElem).fadeOut(obj.config.speed,function(){
								obj.config.afterClose();
								obj.enableScroll();
								if(transitionIn || transitionOut) $(obj.childElem).removeClass(transitionIn + " " + transitionOut);
							});
						},delay);
					},

					/* scrollbar helpers */

					detectScrollBarWidth : function(){
		            	var div = document.createElement('div');
		                	div.className = "detect_scroll_width";
		                	document.body.appendChild(div);
		                	this.scrollWidth = div.offsetWidth - div.clientWidth;
		                	document.body.removeChild(div);
		            },

					disableScroll : function(){
		              	$('body').addClass('wrapper').css('padding-right',this.scrollWidth + 'px');
		              
		            },

		            enableScroll : function(){
		              	$('body').removeClass('wrapper').css('padding-right','0px');
		            }

				}

				Popup.init();
			});

		}

	});

})(jQuery);