(function () {
	var page_scripts = function () {
		if (!$("#dashboard").length) return;

	    // Range Datepicker
        $('.input-daterange').datepicker({
        	autoclose: true,
        	orientation: 'right top',
        	endDate: new Date()
        });
	};

	$(document).on("ready page:load", page_scripts);
})();