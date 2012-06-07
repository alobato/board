//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require bootstrap
//= require_tree .

jQuery(function() {

  $(".item").each(function() {
    metric_id = $(this).attr('id').replace(/[^\d]+/g, '');
    refresh_every = parseInt($(this).data('refresh-every'));
    if (refresh_every > 0)
      timer(metric_id, (refresh_every * 1000));
  });

  function timer(metric_id, time) {
    eval("var auto_refresh" + metric_id + " = setInterval(function() { update_metric(metric_id) }, time);")
  }

  function update_metric(metric_id) {
    $.get("/metrics/" + metric_id, function(data) {
      $("#m" + metric_id).replaceWith(data);
      $(".knob").knob();
    });
  }

  $('#metrics').sortable({
      axis: 'y',
      dropOnEmpty: false,
      handle: '.handle',
      cursor: 'crosshair',
      items: 'tr',
      opacity: 0.4,
      scroll: true,
    stop: function(event, ui) {
      $(ui.item).effect("highlight");
      var metric_id = $(ui.item).attr('id').replace(/[^\d]+/g, '');
      var position = ui.item.prevAll().length;
      $.post($(this).data('update-url'), {
        'metric_id': metric_id,
        'position': position
      });
      $(ui.item).effect("highlight");
    }
  });

  $(".knob").knob();

});
