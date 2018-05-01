package com.synergy.task

import grails.gorm.transactions.Transactional
import org.springframework.stereotype.Component

@Component
@Transactional
class ProjectRepositoryService {

    def save(Project project) {
        project.save(validate: false)
    }

    def update(Project project) {
        project.merge(validate: false)
    }

    def delete(Project project) {
        project.delete()
    }
}
