name "web"

default_attributes({
  nginx: {
    gzip_comp_level: 9,
  },
})

run_list([
  "recipe[nginx]",
  "recipe[sites]",
])
