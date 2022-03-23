echo "Legger til $RUNNER_TEMP/bindings/ca-certificates/SKEROOTCA.pem"
mkdir -p $RUNNER_TEMP/bindings/ca-certificates
echo "ca-certificates" > $RUNNER_TEMP/bindings/ca-certificates/type
echo "$SKEROOTCA" > $RUNNER_TEMP/bindings/ca-certificates/SKEROOTCA.pem