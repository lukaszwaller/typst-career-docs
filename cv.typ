#let defaults = (
  name: "",
  email: "",
  phone: "",
  location: "",
  website: "",
  linkedin: "",
  github: "",
  skills: (languages: (), frameworks: ()),
)

#let data = defaults + yaml("me.yaml")

My name is #data.name.