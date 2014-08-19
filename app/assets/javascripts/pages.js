$(function(){
  $( 'input[id*="mobile"], input[id*="alternate_phone"]' ).inputmask( "+7 (999) 999-99-99", { autoUnmask: true, removeMaskOnSubmit: true } );
  $( 'input[id*="time_to_metro"]' ).inputmask({ mask: "9[9] минут", greedy: false });
  $( 'input[id*="name"]' ).suggestions({
    serviceUrl: "https://dadata.ru/api/v2",
    token: "bc1bd7a03dd3a2e978da08cef9bdcc1bbc750fe4",
    type: "NAME",
    /* Вызывается, когда пользователь выбирает одну из подсказок */
    onSelect: function(suggestion) {
        console.log(suggestion);
    }
  });
  $( 'input[id*="address"]' ).suggestions({
    serviceUrl: "https://dadata.ru/api/v2",
    token: "bc1bd7a03dd3a2e978da08cef9bdcc1bbc750fe4",
    type: "ADDRESS",
    /* Вызывается, когда пользователь выбирает одну из подсказок */
    onSelect: function(suggestion) {
        console.log(suggestion);
    }
  });
})