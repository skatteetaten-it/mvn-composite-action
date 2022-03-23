echo "Legger til /tmp/bindings/ca-certificates/SKEROOTCA.pem"
mkdir -p /tmp/bindings/ca-certificates
echo "ca-certificates" > /tmp/bindings/ca-certificates/type
echo "$SKEROOTCA" > /tmp/bindings/ca-certificates/SKEROOTCA.pem