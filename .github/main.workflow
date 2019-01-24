workflow "New workflow" {
  on = "push"
  resolves = ["Shell"]
}

action "npm install" {
  uses = "actions/npm@de7a3705a9510ee12702e124482fad6af249991b"
  args = "install"
}

action "npm run build" {
  uses = "actions/npm@de7a3705a9510ee12702e124482fad6af249991b"
  needs = ["npm install"]
  args = "run build"
}

action "Shell" {
  uses = "veggiemonk/bin/git@master"
  args = "status"
  needs = ["npm run build"]
  secrets = ["GITHUB_TOKEN"]
  env = {
    "GIT_EMAIL" = "alex.blaine@layder.io"
    GIT_USERNAME = "veggiemonk"
  }
}

workflow "New workflow 1" {
  on = "push"
}
