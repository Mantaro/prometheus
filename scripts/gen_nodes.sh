#!/bin/sh

echo "Generating nodes: $@"

gen_instance() {
  name=$1
  instance=$2
  ip=$3
  port=$4
  echo "{ \"labels\": { \"job\": \"$name\", \"instance\": \"node-$instance\" },"
  echo "\"targets\": [ \"$ip:$port\" ] }"
}

gen_job() {
  name=$1
  ip=$2
  base=$3
  count=$4
  node_number=0
  if [ "$ip" = "host" ]; then
    ip=$(ip route show | awk '/default/ {print $3}')
  fi
  if [ "$ip" = "none" ]; then
    return 0
  fi
  for port in $(seq $base $(($base + $count - 2))); do
    gen_instance $name $node_number $ip $port
    echo ","
    node_number=$(($node_number + 1))
  done
  gen_instance $name $node_number $ip $(($base + $count -1))
}


echo '['
gen_job "$@"
echo ']'
