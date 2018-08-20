# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Course.create( name: 'I/O Avenue Highway Summer 2018'
               Teacher: 'Clay Terry'
                description: "I/O Avenue is a 12 week program that teaches the fundamental skills to become a great software developer."
                )

User.create(name: 'Christopher Ashby'
            email: "c@c.com",
            password: "123456",
            password_confirmation: "123456",
            gh_name: "christopherashby",
            role: 0)

User.create(name: 'Clay Terry'
            email: "l@test.com",
            password: "123456",
            password_confirmation: "123456",
            gh_name: "lclaytont",
            role: 1)

User.create(name: 'Arisa'
            email: "a@a.com",
            password: "123456,"
            password_confirmation: "123456",
            gh_name: "AYEvb07"
            role: 0)

User.create(name: 'Dana'
            email: "d@d.com"
            password:"123456"
            password_confirmation: "123456"
            gh_name: "DanaLTerry"
            role: 0)

User.create(name: 'Keith')
User.create(name: 'Montrell')
User.create(name: 'Brandon')
User.create(name: 'Josh')
User.create(name: 'Lutrell')
User.create(name: 'Ulysses')
User.create(name: 'Jennifer')