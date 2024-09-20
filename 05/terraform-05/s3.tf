module "object_storage_develop" {
  source         = "git::https://github.com/terraform-yc-modules/terraform-yc-s3.git?ref=bb05dc3887e44fe53e103d521bad0894117d25e8"
  
  bucket_name    = var.s3_dev_mod.bucket_name
  max_size       = var.s3_dev_mod.max_size
}