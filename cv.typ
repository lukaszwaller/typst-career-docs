#let defaults = (
  name: "",
  email: "",
  phone: "",
  location: "",
  website: "",
  linkedin: "",
  github: "",
  experience: (),
  projects: (),
  education: (),
  skills: (languages: (), frameworks: (), others: ()),
)

#let data = defaults + yaml("me.yaml")

#set page(margin: 15mm)
#show link: underline

#align(center)[
  = #data.name

  == #data.profession

  #link("mailto:" + data.email) | #link("tel:" + data.phone)
  #linebreak()
  #link("https://" + data.github)[#data.github] |
  #link("https://" + data.website)[#data.website] |
  #link("https://" + data.medium)[#data.medium]
]

== Skills

#line(length: 100%)

*Programming languages:* #(data.skills.languages.join(", "))
#linebreak()
*Frameworks:* #(data.skills.frameworks.join(", "))
#linebreak()
*Cloud Architecture:* #(data.skills.others.join(", "))

== Experience

#line(length: 100%)

#for xp in data.experience {
  grid(columns: (80%, 20%), [
    *#xp.title*, #xp.company - #xp.location
  ], [
    #if xp.at("date") != none and xp.date != "" {
      align(right)[#xp.date]
    }
  ])
  if xp.at("description") != none {
    if type(xp.description) == array {
      set par(leading: 0.6em)
      set list(indent: 0.6em)
      for item in xp.description {
        list(item)
      }
    } else {
      // fallback if someone provided a single string instead of a list
      set par(leading: 0.6em)
      xp.description
    }
  }
}

== Projects

#line(length: 100%)

#for project in data.projects {
  grid(columns: (90%, 10%), [
    *#project.name*
    #linebreak()
    #project.description
  ], if project.at("link") != none and project.link != "" {
    align(right)[
      #link(project.link)[View]
    ]
  } else {
    []
  })
}

== Education

#line(length: 100%)

#for edu in data.education {
  [
    *#edu.institution* (#edu.location): *#edu.degree* - #edu.grade
    #linebreak()
  ]
}