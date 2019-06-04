// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery2
//= require popper
//= require bootstrap

$(document).ready(function() {
  $("#old_table_id").DataTable({
    ajax: {
      url: "/proccessed_old_data_tables.json",
      dataSrc: ""
    },
    columns: [
      { data: "title" },
      { data: "username" },
      { data: "name" },
      { data: "email" },
      { data: "hometown" }
    ],
    displayLength: 10,
    paging: true,
    processing: true,
    deferRender: true,
    serverSide: true
    // iDisplayLength: 10
  });
});

// FOR AJAX on DataTables Index
// $(document).ready(function() {
//   $("#table_id").DataTable({
//     pageLength: 10,
//     ajax: {
//       url: "/data_tables.json",
//       dataSrc: ""
//     },
//     columns: [
//       { data: "title" },
//       { data: "username" },
//       { data: "name" },
//       { data: "email" },
//       { data: "hometown" }
//     ],
//     paging: true,
//     deferRender: true
//   });
// });
