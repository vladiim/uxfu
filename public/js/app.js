// CAN I USE OPAL CARD

$(".form-place-to").popover();
$(".form-place-from").popover();
$(".form-trip").popover();
$(".form-day").popover();
$(".result-fare").popover();
$('.result-provider').popover();

$(document).on('click', ".form-place-to", function() {
  $(".popover-content a").on('click', function(event) {
    event.preventDefault();
    var target = $(event.target)
    var dollar = Math.floor(Math.random() * 10) + 1;
    var cents  = Math.floor(Math.random() * 99) + 11;
    $('.form-place-to').text(target.text());
    $('.result-fare').text('$' + dollar + '.' + cents);
  });
});

$(document).on('click', ".form-place-from", function() {
  $(".popover-content a").on('click', function(event) {
    event.preventDefault();
    var target = $(event.target)
    var dollar = Math.floor(Math.random() * 10) + 1;
    var cents  = Math.floor(Math.random() * 99) + 01;
    $('.form-place-from').text(target.text());
    $('.result-fare').text('$' + dollar + '.' + cents);
  });
});

// ADMIN

$(".card-details-title").popover();
$(".card-details-name").popover();