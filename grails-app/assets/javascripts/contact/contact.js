var ContactTable = function (editable) {
    "use strict";

    this.editable = editable;

    if (this.editable) {
        new TableWrapper("contactsTable");
    }
};
