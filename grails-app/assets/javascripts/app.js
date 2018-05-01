//= require_tree .
//= require_self

$(document).ready(function () {

    var editable = $('#editable').val();

    $.extend(this, new ContactTable(editable));

    if (!editable) {
        disableFields();
    }
});

function disableFields() {
    $(".form-control").each(function () {
        $(this).attr('disabled', 'disabled');
    });

    $(".contactInput").each(function () {
        $(this).attr('disabled', 'disabled');
    });

}