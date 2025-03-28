#!/bin/bash

set -eu

RPI_BUILD_SVC="macmind_rpi_w_splash"
RPI_BUILD_USER="imagegen"
RPI_CUSTOMIZATIONS_DIR="macmind_rpi_customizations"
RPI_IMAGE_NAME="macmind_rpi_w_splash"

# Build a custom raspberry pi image
# with a splash screen
#
docker compose build ${RPI_BUILD_SVC}

docker compose run -d ${RPI_BUILD_SVC} \
  && docker compose exec ${RPI_BUILD_SVC} bash -c "/home/${RPI_BUILD_USER}/rpi-image-gen/build.sh -D /home/${RPI_BUILD_USER}/${RPI_CUSTOMIZATIONS_DIR} -c ${RPI_IMAGE_NAME} -o /home/${RPI_BUILD_USER}/${RPI_CUSTOMIZATIONS_DIR}/${RPI_IMAGE_NAME}.options" \
  && docker ps -a --format '{{.Names}}' | grep ${RPI_BUILD_SVC} | xargs -I '{}' -- docker cp {}:/home/${RPI_BUILD_USER}/rpi-image-gen/work/${RPI_IMAGE_NAME}/deploy/${RPI_IMAGE_NAME}.img ./deploy/${RPI_IMAGE_NAME}-$(date +%m-%d-%Y-%H%M).img \
  && docker compose kill ${RPI_BUILD_SVC} \
  && docker ps -a --format '{{.Names}}' | grep ${RPI_BUILD_SVC} | xargs -I '{}' -- docker rm {}