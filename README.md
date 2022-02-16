# mvn-composite-action

mvn-composite-actions er github actions for å sette opp en spring boot applikasjon i github og deploye til azure.

### Eksempel på å bygge en branch

Lag filen .github/workflows/branches_build_image_with_buildnumber.yml

```
name: build branch

on:
 push:
   branches-ignore:
     - main

jobs:
  build-branch:
    runs-on: aks-runner
    steps:
      - name: build
        uses: skatteetaten-it/mvn-composite-action@v1
        with:
          type: "branch"
          skerootca: ${{ secrets.SKEROOTCA }}
          nexus-user: ${{ secrets.NEXUS_USERNAME }}
          nexus-pass: ${{ secrets.NEXUS_PASSWORD }}
          github-token: ${{ secrets.GITHUB_TOKEN }}
          sonarqube-token: ${{ secrets.SONARQUBE_TOKEN }}
          nexusiq-username: ${{ secrets.NEXUSIQ_USERNAME }}
          nexusiq-password: ${{ secrets.NEXUSIQ_PASSWORD }}
          nexusiq-applicationid: no.skatteetaten.skyklarpilot.referanse-app
          image-name: ghcr.io/skatteetaten-it/skyklar-pilot/referanse-app/referanse-app
```

### Eksempel på å bygge en relase

Lag filen .github/workflows/release.yml

```
name: Release build

on:
  release:
    types: # This configuration does not affect the page_build event above
      - created

jobs:
  release-build:
    runs-on: aks-runner
    steps:
      - name: build
        uses: skatteetaten-it/mvn-composite-action@v1
        with:
          type: "branch"
          skerootca: ${{ secrets.SKEROOTCA }}
          nexus-user: ${{ secrets.NEXUS_USERNAME }}
          nexus-pass: ${{ secrets.NEXUS_PASSWORD }}
          github-token: ${{ secrets.GITHUB_TOKEN }}
          sonarqube-token: ${{ secrets.SONARQUBE_TOKEN }}
          nexusiq-username: ${{ secrets.NEXUSIQ_USERNAME }}
          nexusiq-password: ${{ secrets.NEXUSIQ_PASSWORD }}
          nexusiq-applicationid: no.skatteetaten.skyklarpilot.referanse-app
          image-name: ghcr.io/skatteetaten-it/skyklar-pilot/referanse-app/referanse-app
```

## Hoved action skatteetaten-it/mvn-composite-action@v1

Denne bygger, kjører tester, publiser til sonar og deployer en spring-boot applikasjon.

parametre er:

- skerootca (root ca for skatteetaten, skal være en secret)
- nexus-user (Nexus brukernavn, skal være en secret)
- nexus-pass (Nexus passord, skal være en secret)
- sonarqube-tokens (Token fra sonar, skal være en secret)
- sonarqube-host (hostnavn til sonar)
- github-token (github token, er en secret som kommer fra github)
- image-name (lokasjon til docker image som blir bygd
- nexusiq-username (Nexus iq username)
- nexusiq-password (Nexus iq pqssword)
- nexusiq-applicationid (Nexus iq applikasjonsid)

## Versjon action skatteetaten-it/mvn-composite-action/version@v1

Denne henter ut et versjonsnummer for bygget

parametre er:

- type (branch, release, Branch henter versjon ut i fra branch-navn, relese henter den fra tag)

## Setup action skatteetaten-it/mvn-composite-action/setup@v1

Denne setter opp github med mvn og kobling mot nexus samt rootca. Den er en del action av hoved action men kan også benyttes seperat.

parametre er:

- skerootca (root ca for skatteetaten, skal være en secret)

## Test report action skatteetaten-it/mvn-composite-action/test-report@v1

Lager en jacoco test rapport samt oppdater github badges. Den er en del action av hoved action men kan også benyttes seperat.

parametre er:

- jacoco-csv-file (Settes om man har den på en annen lokasjon en standard)

## Deploy action skatteetaten-it/mvn-composite-action/deploy@v1

Delpoyer til et docker repository. Den er en del action av hoved action men kan også benyttes seperat.

parametre er:

- nexus-user (Nexus brukernavn, skal være en secret)
- nexus-pass (Nexus passord, skal være en secret)
- github-token (github token, er en secret som kommer fra github)
- image-name (lokasjon til docker image som blir bygd, denne bør inneholde
