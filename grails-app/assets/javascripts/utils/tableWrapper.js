/**
 *
 * This class is custom logic for building dynamic table
 */
var TableWrapper = function (tableId) {

    this.tableId = tableId;
    this.addLink = tableId + 'AddLink';
    this.deleteLink = tableId + 'DeleteLink';
    this.deleteLinkClass = '.' + this.deleteLink;
    this.bodyRow = tableId + 'Row';
    this.callbackFunctions = {};


    var template = $('#' + tableId + 'TemplateRow');

    template.attr('id', this.bodyRow);
    this.templateRow = template;
    template.remove();

    this.initTableEvents();
};

TableWrapper.prototype.getTable = function () {
    return $('#' + this.tableId);
};

TableWrapper.prototype.getAddLink = function () {
    return $('#' + this.addLink);
};

TableWrapper.prototype.getRows = function () {
    var self = this;

    return self.getTable().find('tr').filter(function (index, row) {
        return $(row).attr('id') === self.bodyRow;
    });
};

TableWrapper.prototype.getSequenceNumber = function () {
    return this.getRows().length;
};


TableWrapper.prototype.bindAddButton = function () {
    var self = this;

    self.getAddLink().unbind('click').click(function () {
        self.createNewLine();
    });
};

TableWrapper.prototype.createNewLine = function () {
    var self = this;

    var new_line = self.templateRow.clone(true);

    var sequenceNum = self.getSequenceNumber();

    new_line.find('.contactInput').each(function (key, value) {
        $(this).attr('name', $(this).attr('name').replace(/\d+/, sequenceNum));
        $(this).attr('id', $(this).attr('id').replace(/\d+/, sequenceNum));
        $(this).val('');
    });

    var indexTd = $(new_line).find('td#index');
    if (indexTd !== undefined) {
        indexTd.html(sequenceNum + 1);
    }

    new_line.show();
    new_line.appendTo(self.getTable());
    self.bindRemoveButton(new_line);

    self.initEventListeners([EVENT.ADD], new_line);
    return new_line;
};


TableWrapper.prototype.recalculateRows = function () {
    this.getRows().each(function (index, row_line) {
        $(row_line).find('.contactInput').each(function () {
            $(this).attr('name', $(this).attr('name').replace(/\d+/, index));
            $(this).attr('id', $(this).attr('id').replace(/\d+/, index));
        });

        var indexTd = $(row_line).find('td#index');
        if (indexTd !== undefined) {
            indexTd.html(index + 1);
        }
    });
};

TableWrapper.prototype.bindRemoveButton = function (table_row) {
    var self = this;

    table_row.find(self.deleteLinkClass).click(function () {
        $(this).closest('tr').remove();
        self.initEventListeners([EVENT.REMOVE], table_row);
        self.recalculateRows();
    });
};

TableWrapper.prototype.initTableEvents = function () {
    var self = this;
    self.bindAddButton();

    this.getTable().find('a' + self.deleteLinkClass).bind('click', function () {
        self.initEventListeners([EVENT.REMOVE], $(this).parent().parent());
        $(this).closest('tr').remove();
        self.recalculateRows();
    });
};

TableWrapper.prototype.initEventListeners = function (forEvents, row) {
    var self = this;
    $.each(forEvents, function (index, event) {
        var listOfFunc = self.callbackFunctions[EVENT.valueOf(event)];
        if (listOfFunc !== undefined) {
            $.each(self.callbackFunctions[EVENT.valueOf(event)], function (index, callback) {
                if (callback !== undefined) {
                    callback(row);
                }
            });
        }
    });
};
