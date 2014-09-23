/* ==============================================================================
// Scripts for the theme
// ============================================================================== */

var ready = function() {

	// sidebar menus
	Sidebar.initialize();

	// build custom selects
	UI.smart_selects();
	UI.select2_selects();

	// Suggestions names
	Suggestions.names();

	// Suggestions address
	Suggestions.address();

	// Mask phone numbers
	Mask.phones();

	// Mask metro information
	Mask.metro();

	// Mask money information
	Mask.money();

  // Назначить риелтором по объекту себя
  SetApartmentForSelf.initialize();

	// tooltips
	$("[data-toggle='tooltip']").tooltip();

	// retina display
	if(window.devicePixelRatio >= 1.2){
	    $("[data-2x]").each(function(){
	        if(this.tagName == "IMG"){
	            $(this).attr("src",$(this).attr("data-2x"));
	        } else {
	            $(this).css({"background-image":"url("+$(this).attr("data-2x")+")"});
	        }
	    });
	}

	Number.prototype.formatMoney = function(c, d, t){
		var n = this, 
		    c = isNaN(c = Math.abs(c)) ? 2 : c, 
		    d = d == undefined ? "." : d, 
		    t = t == undefined ? "," : t, 
		    s = n < 0 ? "-" : "", 
		    i = parseInt(n = Math.abs(+n || 0).toFixed(c)) + "", 
		    j = (j = i.length) > 3 ? j % 3 : 0;
		   return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "");
	};
};

$(document).on("ready page:load", ready);

$(document).on("page:change", function () {
	window.prevPageYOffset = window.pageYOffset;
    window.prevPageXOffset = window.pageXOffset;
});

$(document).on("page:load", function () {
	if ($(".fix-scroll").length > 0) {
		$('.fix-scroll').hide().show() // force re-render -- having an issue with that on Chrome/OSX
      	//window.scrollTo(window.prevPageXOffset, window.prevPageYOffset);
	}
});


var UI = {
	smart_selects: function () {
		var $selects = $("[data-smart-select]");
		$.each($selects, function (index, el) {
			var $select = $(el);

			// It has been already initialized
			if ($select.parent().hasClass("fake-select-wrap")) {
				$select.siblings(".fake-select").html($select.find("option:selected").text());
				return;
			}

			var $wrapper = $("<div class='fake-select-wrap' />");
			var $fake_select = $("<div class='fake-select'></div>");
			$select.wrap($wrapper);
			$select.after($fake_select);

			// set selected value as default
			$fake_select.html($select.find("option:selected").text());

			// change handler
			$select.change(function () {
				$fake_select.html($(this).find("option:selected").text());
			});

			$select.focus(function () {
				$fake_select.addClass("focus");
			}).focusout(function () {
				$fake_select.removeClass("focus");
			});
		});
	},
	select2_selects: function () {
		$(".select2").select2({
			//placeholder: 'Select tags or add new ones'	
		});
	}
}

var Sidebar = {
	initialize: function () {
		var $sidebar_menu = $(".main-sidebar");
		
		// my account dropdown menu
		var $account_menu = $sidebar_menu.find(".current-user .menu");
		$(".current-user .name").click(function (e) {
			e.preventDefault();
			e.stopPropagation();
			$account_menu.toggleClass("active");
		});

		$account_menu.click(function (e) { e.stopPropagation() });
		$("body").click(function () { $account_menu.removeClass("active") });


		// sidebar menu dropdown levels
		var $dropdown_triggers = $sidebar_menu.find("[data-toggle~='sidebar']");

		$dropdown_triggers.click(function (e) {
			e.preventDefault();

			if (!utils.isTablet()) {
				// reset other dropdown menus
				if (!$(this).closest(".submenu").length) {
					$dropdown_triggers.not(this).removeClass("toggled").siblings(".submenu").slideUp(300, check_height);
				}

				var $trigger = $(this);
				var $dropdown = $(this).siblings(".submenu");

				$trigger.toggleClass("toggled");
				
				if ($trigger.hasClass("toggled")) {
					$dropdown.slideDown(300, check_height);
				} else {
					$dropdown.slideUp(300, check_height);
				}
			}
		});


		// setup active dropdown menu option
		var path_name = window.location.pathname;
		// reset all links states
		$sidebar_menu.find(".menu-section a").removeClass("active");

		var $active_link = $sidebar_menu.find("a[href='" + path_name + "']");
		if ($active_link.length) {
			$active_link.addClass("active");

			// it's a link from a submenu
			if ($active_link.parents(".submenu").length) {
				var $parent = $active_link.closest(".option").find("[data-toggle~='sidebar']");
				$parent.addClass("active toggled");
				$active_link.parents(".submenu").addClass("active");
			}
		} else {
			$sidebar_menu.find(".menu-section .option > a:eq(0)").addClass("active");
		}


		// fix sidebar height depending on browser dimensions
		var check_height = function () {
			var height = $("body").height();
			$(".main-sidebar").css("bottom", "auto");
			var sidebar_height = $(".main-sidebar").height();

			if (height > sidebar_height) {
				$(".main-sidebar").css("bottom", 0);
			} else {
				$(".main-sidebar").css("bottom", "auto");
			}
		};


		// mobile sidebar toggler
		var $mobile_toggler = $("#content .sidebar-toggler");
		$mobile_toggler.click(function (e) {
			e.stopPropagation();
			$("body").toggleClass("open-sidebar");
		});

		$("#content").click(function () {
			$("body").removeClass("open-sidebar");
		})
	}
};

window.utils = {
	isFirefox: function () {
		return navigator.userAgent.toLowerCase().indexOf('firefox') > -1;
	},
	animation_ends: function () {
		return "animationend webkitAnimationEnd oAnimationEnd";
	},
	isTablet: function () {
		return ($(".main-sidebar").width() < 100);
	},
	get_timestamp: function (less_days) {
    	return moment().subtract('days', less_days).toDate().getTime();
    }
};

var Suggestions = {
	names: function () {
		var $names	= $( 'input[id*="name"]' );

		if ( !$names.length ) {
			return;
		}

		$names.suggestions({
	    serviceUrl: "https://dadata.ru/api/v2",
	    token: "bc1bd7a03dd3a2e978da08cef9bdcc1bbc750fe4",
	    type: "NAME"//,
	    /* Вызывается, когда пользователь выбирает одну из подсказок */
	    //onSelect: function(suggestion) {
	    //    console.log(suggestion);
	    //}
	  });

	},
	address: function () {
		var $addr		= $( 'input[id*="address"]' );

		if ( !$addr.length ) {
			return;
		}

		$addr.suggestions({
	    serviceUrl: "https://dadata.ru/api/v2",
	    token: "bc1bd7a03dd3a2e978da08cef9bdcc1bbc750fe4",
	    type: "ADDRESS",
	    constraints: {
        checkLocation: false,
      }//,
	    /* Вызывается, когда пользователь выбирает одну из подсказок */
	    //onSelect: function(suggestion) {
	        //console.log(suggestion);
	    //}
	  });
	}
};

var Mask = {
	phones: function () {
		var $phone = $( 'input[id*="mobile"], input[id*="alternate_phone"]' );

		if ( !$phone.length ) {
			return;
		}

		$( 'input[id*="mobile"], input[id*="alternate_phone"]' ).inputmask( "+7 (999) 999-99-99", { autoUnmask: true, removeMaskOnSubmit: true } );
	},
	metro: function () {
		var $metro = $( 'input[id*="time_to_metro"]' );

		if ( !$metro.length ) {
			return;
		}

		$( 'input[id*="time_to_metro"]' ).inputmask({ mask: "9[9] минут", greedy: false });
	},
	money: function () {
		var $money = $( 'input[id*="price"]' );

		if ( !$money.length ) {
			return;
		}

		$( 'input[id*="price"]' ).inputmask({ 
			groupSeparator: ' ',
			autoGroup: true,
			digits: 2,
			digitsOptional: false,
			suffix: ' руб',
			placeholder: '0',
			alias: 'numeric',
			rightAlign: false,
			greedy: false, 
			autoUnmask: true, 
			removeMaskOnSubmit: true  
		});
	}
};

var SetApartmentForSelf = {
  initialize: function () {
    $( '#set-apartment-for-self' ).on( 'click', function (e) {
      e.preventDefault();
      $( '#apartment_user_id option[value="' + current_user.id + '"]' ).attr( "selected", "selected" ).siblings().removeAttr( "selected" );
      $( '#apartment_user_id' ).val( current_user.id );
      $( '.fake-select' ).text( current_user.name );
    });
  }
}