package com.synergy.task

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?" {
            constraints {

            }
        }

        "/"(controller: 'project', action: 'list')
        "/index"(controller: 'project', action: 'list')
        "/project"(controller: 'project', action: 'list')


        "500"(view: '/accessDenied')
        "404"(view: '/accessDenied')
        "405"(view: '/accessDenied')
    }
}
