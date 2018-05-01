package com.synergy.task

class Contact {

    Long id
    String name
    String email
    String phone

    static belongsTo = [project: Project]

    static constraints = {
        name(nullable: false, maxSize: 30)
        email(nullable: false, maxSize: 30)
        phone(nullable: true, maxSize: 30)
    }

    static mapping = {
        table 'CONTACT'

        id generator: 'increment'
        name column: 'NAME', length: 30
        email column: 'EMAIL', length: 30
        phone column: 'PHONE', length: 30
    }
}
