FROM rocker/geospatial:3.5.1

RUN set -x && \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    libudunits2-dev \
    libgdal-dev \
    libgeos-dev \
    libproj-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* && \
  install2.r --error \
    here \
    kokudosuuchi \
    osmdata && \
  installGithub.r \
    "r-spatial/lwgeom" \
    "r-spatial/sf" \
    "tidyverse/ggplot2" \
    "uribo/jpmesh" \
    "uribo/jpndistrict" \
    "uribo/sealr" \
    "uribo/sessiondiverge"
