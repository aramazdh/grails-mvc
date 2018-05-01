package com.synergy.task

import grails.databinding.SimpleMapDataBindingSource
import grails.web.databinding.GrailsWebDataBinder
import org.springframework.beans.factory.annotation.Autowired


class ProjectController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Autowired
    ProjectRepositoryService repositoryService

    @Autowired
    GrailsWebDataBinder grailsWebDataBinder

    def list() {
        List<Project> projects = Project.list()

        render(view: 'list', model: [projects: projects])
    }

    def create() {
        Project project = new Project()

        render(view: 'create', model: [project: project])
    }

    def show() {
        Long id = params.long('id')
        Project project = Project.get(id)

        if (!project) {
            render(view: '/accessDenied')
            return
        }

        render(view: 'show', model: [project: project])
    }

    def edit() {
        Long id = params.long('id')
        Project project = Project.get(id)

        if (!project) {
            render(view: '/accessDenied')
            return
        }

        render(view: 'edit', model: [project: project])
    }

    def save() {
        Project project = new Project(params)

        boolean verified = project.validate()

        if (!verified) {
            render(view: 'create', model: [project: project])
            return false
        }

        repositoryService.save(project)

        redirect(action: 'list')
    }

    def update() {
        Project project = Project.get(params.long('id'))

        project.contacts.clear()
        grailsWebDataBinder.bind(project, params as SimpleMapDataBindingSource)

        boolean verified = project.validate()

        if (!verified) {
            render(view: 'edit', model: [project: project])
            return
        }

        repositoryService.update(project)

        redirect(action: 'list')
    }

    def delete() {
        Project project = Project.get(params.long('id'))

        repositoryService.delete(project)

        redirect(action: 'list')
    }
}
