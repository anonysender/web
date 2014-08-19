// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require_tree .

(function($){
  var Email = Backbone.Model.extend({
    urlRoot: "/mails"
  });

  var EmailView = Backbone.View.extend({
    template: _.template($("#email-template").html()),
    el: "#mail",
    events: {
      "submit #email-form": 'sendMail'
    },
    render: function() {
      $(this.el).html(this.template());
    },
    initialize: function() {
      this.render();
    },
    sendMail: function(event) {
      event.preventDefault();
      $("#send-mail").attr("disabled", "disabled");
      $("#send-mail").text("Sending email...");

      var formData = Backbone.Syphon.serialize(this);
      this.model.set(formData);

      var self = this;
      this.model.save(null, {
        success: function (model, response) {
          self.resetPanes();
          self.resetSendMailButton();
          $("#sent-successfully").fadeIn();
          self.resetForm();
        },
        error: function (model, response) {
          self.resetPanes();
          self.resetSendMailButton();
          $("#send-error").fadeIn();
          self.resetForm();
        }
      });
    },
    resetSendMailButton: function() {
      $("#send-mail").attr("disabled", null);
      $("#send-mail").text("Send Mail");
    },
    resetPanes: function() {
      $(".pane").hide();
    },
    resetForm: function() {
      $(".form-control").val("");
      $("input[type='email']").focus();
    }
  });

  // Initialize the view
  new EmailView({ model: new Email()});
})(jQuery);
