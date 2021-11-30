echo "Hello World"
if [ -z "$1" ]
  then
    echo "Ingen parametre"
    mkdir -p ./bindings/ca-certificates
    echo "ca-certificates" > ./bindings/ca-certificates/type
    echo "$SKEROOTCA" > ./bindings/ca-certificates/SKEROOTCA.pem
fi
for ((i = 1; i <= $#; i++ )); do
  printf '%s\n' "Arg $i: ${!i}"
  mkdir -p ./$1/bindings/ca-certificates
  echo "ca-certificates" > ./$1/bindings/ca-certificates/type
  echo "$SKEROOTCA" > ./$1/bindings/ca-certificates/SKEROOTCA.pem
done

