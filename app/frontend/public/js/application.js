(function() {
  var checkOnline;

  checkOnline = function(dom, uri) {
    dom = $(dom);
    $(dom).removeClass(['online', 'offline']);
    $('.checking', dom).show();
    return $.ajax(uri).done(function(data) {
      var ol;
      ol = data === 'online';
      $('.checking', dom).hide();
      return dom.toggleClass('online', ol).toggleClass('offline', !ol);
    });
  };

  jQuery(function($) {
    var checkAll;
    checkAll = function() {
      checkOnline($('#web-primary'), 'web/primary');
      checkOnline($('#web-secondary'), 'web/secondary');
      checkOnline($('#tunnel-primary'), 'tunnel/primary');
      checkOnline($('#tunnel-secondary'), 'tunnel/secondary');
      checkOnline($('#shadow-primary'), 'shadow/primary');
      checkOnline($('#shadow-secondary'), 'shadow/secondary');
      console.log('check');
      return setTimeout(checkAll, 10000);
    };
    return checkAll();
  });

  (function() {
    var console, length, method, methods, noop, _results;
    noop = function() {};
    methods = ['assert', 'clear', 'count', 'debug', 'dir', 'dirxml', 'error', 'exception', 'group', 'groupCollapsed', 'groupEnd', 'info', 'log', 'markTimeline', 'profile', 'profileEnd', 'table', 'time', 'timeEnd', 'timeStamp', 'trace', 'warn'];
    length = methods.length;
    console = (window.console = window.console || {});
    _results = [];
    while (length--) {
      method = methods[length];
      if (!console[method]) {
        _results.push(console[method] = noop);
      } else {
        _results.push(void 0);
      }
    }
    return _results;
  })();

}).call(this);
