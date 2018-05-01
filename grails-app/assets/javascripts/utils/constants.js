var EVENT = {
    ADD: 'add',
    REMOVE: 'remove',

    'valueOf': function (inputEvent) {
        if (inputEvent.indexOf("add") >= 0) {
            return this.ADD;
        }
        if (inputEvent.indexOf("remove") >= 0) {
            return this.REMOVE;
        }
        throw "Input type " + inputEvent + " not supported";
    }
};