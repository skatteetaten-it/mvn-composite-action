if [ -z "$1" ]
  then
    echo "Legger til ./bindings/ca-certificates/SKEROOTCA.pem"
    mkdir -p ./bindings/ca-certificates
    echo "ca-certificates" > ./bindings/ca-certificates/type
    echo "$SKEROOTCA" > ./bindings/ca-certificates/SKEROOTCA.pem
fi
for ((i = 1; i <= $#; i++ )); do
  echo "Legger til ./${!i}/bindings/ca-certificates/SKEROOTCA.pem"
  mkdir -p ./${!i}/bindings/ca-certificates
  echo "ca-certificates" > ./${!i}/bindings/ca-certificates/type
  echo "$SKEROOTCA" > ./${!i}/bindings/ca-certificates/SKEROOTCA.pem
done