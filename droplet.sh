  curl -X POST \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer dop_v1_d8407f7b8aa1cffdd75a50fecfbdd4a0c8a19e48bbf481a28d8a067ef50c257e" \
  -d '{
    "name":"myDropletAPI",
    "region":"nyc3",
    "size":"s-1vcpu-1gb",
    "image":"ubuntu-22-04-x64"
    }' \
  "https://api.digitalocean.com/v2/droplets"