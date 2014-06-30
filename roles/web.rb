name "web"

default_attributes({
  nginx: {
    gzip_comp_level: 9,
  },
})

run_list([
  "recipe[main]",
  "recipe[nginx]",
  "recipe[sites]",
])
