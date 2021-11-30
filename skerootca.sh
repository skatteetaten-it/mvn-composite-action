if [ -z "$1" ]
  then
    echo "Ingen parametre"
fi
for ((i = 1; i <= $#; i++ )); do
  printf '%s\n' "Arg $i: ${!i}"
done

#mkdir -p ./$1/bindings/ca-certificates
#echo "ca-certificates" > ./$1/bindings/ca-certificates/type
#echo "$SKEROOTCA" > ./$1/bindings/ca-certificates/SKEROOTCA.pem