(function () {
	var page_scripts = function () {
		if (!$(".ui").length) return;

		// Focus input when prompt modal is shown
		$('#prompt-modal').on('shown.bs.modal', function (e) {
			$("#prompt-modal").find("input:text").focus();
		})

		// Focus first input when form modal is shown
		$('#form-modal').on('shown.bs.modal', function (e) {
			$("#form-modal").find("input:text:eq(0)").focus();

			// initialize datepicker when the modal is shown, does not work if the input is hidden
			$("#form-modal .datepicker").datepicker({
	        	autoclose: true
	        });
		})

		// Show message on submit Landlords
		$( '.create-landlord-in-deal [type="submit"]').on( "click", function(e){
			e.preventDefault();
			var $form = $( "#form-modal .create-landlord-in-deal" ),
					$elem = $( "#form-modal" );
			
			$.post( $form.attr("action") + ".json", $form.serializeArray())
				.done(function(data) {
					$( '#new_deal' ).find( '[name*="landlord_id"]' ).append( '<option selected="selected" value="' + data.id + '">' + data.name + '</option>').siblings( '.fake-select' ).text( data.name );
					$elem.modal('hide');
					Messenger().post("Наймодатель создан!");
				})
				.fail(function(data) {
					if( data.responseJSON.name ) {
						$form.find( '[name*="name"]' ).prop("placeholder", data.responseJSON.name[0]).parent().addClass( "has-error" );
					} else {
						$form.find( '[name*="name"]' ).parent().removeClass( "has-error" );
					}
					if( data.responseJSON.mobile) {
						var $errorDiv = $form.find( '[name*="mobile"]' ).siblings( "label" ).children( "i" );
						$form.find( '[name*="mobile"]' ).prop("placeholder", data.responseJSON.mobile[0]).parent().addClass( "has-error" );
						if ( $errorDiv.length == 0 ) {
							$form.find( '[name*="mobile"]' ).siblings( "label" ).append( "&nbsp;<i>" + data.responseJSON.mobile[0] + "</i>" );
						} else {
							$errorDiv.text( data.responseJSON.mobile[0] );
						}
					} else {
						$form.find( '[name*="mobile"]' ).parent().removeClass( "has-error" );
					}
				});
		});
		// Show message on submit tenant
		$( '.create-tenant-in-deal [type="submit"]').on( "click", function(e){
			e.preventDefault();
			var $form = $( "#form-modal-tenant .create-tenant-in-deal" ),
					$elem = $( "#form-modal-tenant" );
			
			$.post( $form.attr("action") + ".json", $form.serializeArray())
				.done(function(data) {
					$( '#new_deal' ).find( '[name*="tenant_id"]' ).append( '<option selected="selected" value="' + data.id + '">' + data.name + '</option>').siblings( '.fake-select' ).text( data.name );
					$elem.modal('hide');
					Messenger().post("Наниматель создан!");
				})
				.fail(function(data) {
					if( data.responseJSON.name ) {
						$form.find( '[name*="name"]' ).prop("placeholder", data.responseJSON.name[0]).parent().addClass( "has-error" );
					} else {
						$form.find( '[name*="name"]' ).parent().removeClass( "has-error" );
					}
					if( data.responseJSON.mobile) {
						var $errorDiv = $form.find( '[name*="mobile"]' ).siblings( "label" ).children( "i" );
						$form.find( '[name*="mobile"]' ).prop("placeholder", data.responseJSON.mobile[0]).parent().addClass( "has-error" );
						if ( $errorDiv.length == 0 ) {
							$form.find( '[name*="mobile"]' ).siblings( "label" ).append( "&nbsp;<i>" + data.responseJSON.mobile[0] + "</i>" );
						} else {
							$errorDiv.text( data.responseJSON.mobile[0] );
						}
					} else {
						$form.find( '[name*="mobile"]' ).parent().removeClass( "has-error" );
					}
				});
		});
		// Show message on submit apartment
		$( '.create-apartment-in-deal [type="submit"]').on( "click", function(e){
			e.preventDefault();
			var $form = $( "#form-modal-apartment .create-apartment-in-deal" ),
					$elem = $( "#form-modal-apartment" );
			
			$.post( $form.attr("action") + ".json", $form.serializeArray())
				.done(function(data) {
					$( '#new_deal' ).find( '[name*="apartment_id"]' ).append( '<option selected="selected" value="' + data.id + '">' + data.address + '</option>').siblings( '.fake-select' ).text( data.address );
					$elem.modal('hide');
					Messenger().post("Объект создан!");
				})
				.fail(function(data) {
					if( data.responseJSON.address ) {
						$form.find( '[name*="address"]' ).prop("placeholder", data.responseJSON.address[0]).parent().addClass( "has-error" );
					}
				});
		});

		// Show message on submit feedback-message
		$( '.create-feedback-message-in-dashboard [type="submit"]').on( "click", function(e){
			e.preventDefault();
			var $form = $( "#form-modal-feedback-message .create-feedback-message-in-dashboard" ),
					$elem = $( "#form-modal-feedback-message" );
			
			$.post( $form.attr("action") + ".json", $form.serializeArray())
				.done(function(data) {
					$elem.modal('hide');
					Messenger().post("Сообщение отправлено!");
				})
				.fail(function(data) {
					if( data.responseJSON.message ) {
						$form.find( '[name*="message"]' ).prop("placeholder", data.responseJSON.message[0]).parent().addClass( "has-error" );
					}
				});
		});

		// Focus first input when form modal is shown
		$('#form-validation-modal').on('shown.bs.modal', function (e) {
			$("#form-validation-modal").find("input:text:eq(0)").focus();
		})

		// Form validation
		$('#new-user-form').validate({
			rules: {
				"landlord[name]": {
					required: true
				},
				"landlord[mobile]": {
					required: true,
					//email: true
				}
			},
			highlight: function (element) {
				$(element).closest('.form-group').removeClass('success').addClass('error');
			},
			success: function (element) {
				element.addClass('valid').closest('.form-group').removeClass('error').addClass('success');
			}
		});


		// Notifications

		Messenger.options = {
			extraClasses: 'messenger-fixed messenger-on-bottom messenger-on-right',
		    theme: 'flat'
		}

		$(".normal-notification").click(function (e) {
			e.preventDefault();
			Messenger().post("A new order has been placed by John Williams!");
		});

		$(".error-notification").click(function (e) {
			e.preventDefault();

			Messenger().post({
			  	message: 'Sorry, there was problem while processing your request.',
			  	type: 'error',
			  	showCloseButton: true
			});
		});

		$(".button-notification").click(function (e) {
			e.preventDefault();

			var msg;
			msg = Messenger().post({
			  	message: 'Uploading new files...',
			  	type: 'info',
			  	actions: {
			    	cancel: {
			      		label: 'cancel upload',
			      		action: function() {
			        		return msg.update({
			          			message: 'File uploading was canceled',
			          			type: 'success',
			          			actions: false
			        		});
			      		}
			    	}
				}
			});
		});

		$(".run-notification").click(function (e) {
			e.preventDefault();

			var i = 0;
			Messenger().run({
			  	errorMessage: 'Error sending message',
			  	successMessage: 'Message sent!',
			  	action: function(opts) {
			    	if (++i < 2) {
			      		return opts.error({
			        		status: 500,
			        		readyState: 0,
			        		responseText: 0
			      		});
			    	} else {
			      		return opts.success();
			    	}
			  	}
			});
		});


		// Guided Tour in app with shepherd.js
		var tour;

		tour = new Shepherd.Tour({
		  	defaults: {
				classes: 'shepherd-element shepherd-open shepherd-theme-arrows',
				showCancelLink: true
		    }
		});

		tour.addStep('example-step', {
		  	text: 'This modal looks really cool for welcoming new users',
		  	attachTo: {
		  		element: '.tour-first-step',
		  		on: 'bottom'
		  	},
		  	buttons: [
		  	{
		      	text: 'Exit',
		      	classes: 'btn btn-default',
		    	action: tour.cancel
		    },
		    {
		    	text: 'Next',
		    	classes: 'btn btn-primary',
		      	action: tour.next
		    }]
		});

		tour.addStep('example-step', {
		  	text: 'This button is useful to show users a message regarding an action on your app',
		  	attachTo: {
		  		element: '.tour-second-step',
		  		on: 'top'
		  	},
		  	buttons: [
		  	{
		      	text: 'Back',
		      	classes: 'btn btn-default',
		    	action: tour.back
		    },
		    {
		    	text: 'Next',
		    	classes: 'btn btn-primary',
		      	action: tour.next
		    }]
		});

		tour.addStep('example-step', {
		  	text: 'This plugin is very useful to notify users of their connections',
		  	attachTo: {
		  		element: '.tour-third-step',
		  		on: 'top'
		  	},
		  	buttons: [
		  	{
		      	text: 'Back',
		      	classes: 'btn btn-default',
		    	action: tour.back
		    },
		    {
		    	text: 'Next',
		    	classes: 'btn btn-primary',
		      	action: tour.next
		    }]
		});

		tour.addStep('example-step', {
		  	text: 'You can change the theme skins here',
		  	attachTo: {
		  		element: '.skin-switcher',
		  		on: 'left'
		  	},
		  	buttons: [
		  	{
		      	text: 'Back',
		      	classes: 'btn btn-default',
		    	action: tour.back
		    },
		    {
		    	text: 'Done',
		    	classes: 'btn btn-success',
		      	action: tour.next
		    }]
		});

		$(".start-tour").click(function (e) {
			e.preventDefault();
			tour.start();
		});
	};

	$(document).on("ready page:load", page_scripts);
})();