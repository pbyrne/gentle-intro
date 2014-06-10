node.set[:site_owner] = "pbyrne"

node.set[:domains]["gentleintro.patrickbyrne.net"] = {type: :static}
node.set[:domains]["nodemn.patrickbyrne.net"] = {
  type: :forward,
  port: 5000,
}
