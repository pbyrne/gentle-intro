name "web"

default_attributes({
  nodejs: {
    install_method: "binary",
    version: "0.10.28",
    checksum_linux_x64: "5f41f4a90861bddaea92addc5dfba5357de40962031c2281b1683277a0f75932",
  },
})

run_list([
  "recipe[main]",
  "recipe[logrotate]",
  "recipe[nginx]",
  "recipe[nodejs]",
  "recipe[sites]",
])
