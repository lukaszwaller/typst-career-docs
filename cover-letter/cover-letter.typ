#let defaults = (
  metadata: (
    title: "",
    keywords: ()
  ),
  adress: (
    name: "",
    street: "",
    number: "",
    zip: "",
    city: ""
  ),
  company: (
    name: "",
    street: "",
    number: "",
    zip: "",
    city: ""
  ),
  paragraphs: (),
)

#let data_file = sys.inputs.at("data", default: "letter.yaml")
#let data = defaults + yaml(data_file)

#set document(
  title: data.metadata.title,
  keywords: data.metadata.keywords,
)

#set page(width: 21cm, height: 29.7cm, margin: 2.5cm)

#align(left)[
  #data.address.name \
  #data.address.street #data.address.number \
  #data.address.zipcode #data.address.city
]

#v(1cm)

#align(left)[
  #data.company.name \
  #data.company.street #data.company.number \
  #data.company.zipcode #data.company.city
]

#v(0.5cm)

#align(right)[
  #data.address.city, #data.date
]

#v(0.5cm)

=== Application for #data.jobtitle

#v(0.3cm)

Dear #data.recipent,

#for p in data.paragraphs {
  p
  v(0.03cm)
}

Thank you for considering my application. \
I look forward to getting to know each other.

Best regards, \

#v(1cm)

#data.address.name
