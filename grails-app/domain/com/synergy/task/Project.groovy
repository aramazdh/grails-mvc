package com.synergy.task

class Project {

    Long id
    String name
    Status status

    List<Contact> contacts = new ArrayList<>()

    static hasMany = [contacts: Contact]

    static constraints = {
        name (nullable: false, maxSize: 30)
        status (nullable: false)
    }

    static mapping = {
        table 'PROJECT'

        id generator: 'increment'
        name column: 'NAME', length: 30
        status column: 'STATUS'
        contacts cascade: 'all-delete-orphan'
    }
}
