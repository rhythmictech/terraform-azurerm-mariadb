
module "tags" {
  source  = "rhythmictech/tags/terraform"
  version = "0.0.2"

  enforce_case = "UPPER"
  tags         = var.tags
  names = [
    var.env,
    var.name
  ]
}
