name "base"

run_list([
  "recipe[main]",
  "recipe[logrotate]",
])
