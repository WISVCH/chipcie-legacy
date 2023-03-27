This repository contains the static content of previous programming contests.

The docker file has a simple router that serves the contest based on the prefix of the domain. e.g. `2001.localhost` or `2005.bapc.eu`.

### Running the image
`docker run -p 8080:8080 ghcr.io/wisvch/chipcie-legacy:<version-tag> `

### BAPC 2020
BAPC 2020 uses a javascipt based layout and can't be scraped. The files are copied directly from the old image.
