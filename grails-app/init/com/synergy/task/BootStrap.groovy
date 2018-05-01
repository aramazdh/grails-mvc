package com.synergy.task

class BootStrap {

    def init = { servletContext ->

        //creating default project on start

        new Project(name: 'Default Project', status: Status.NEW).save()
    }
    def destroy = {
    }
}
