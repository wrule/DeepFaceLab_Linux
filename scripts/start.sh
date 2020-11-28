#!/bin/bash

./2.1_extract_image_from_data_src_batch.sh
yes "" | ./4_data_src_extract_faces_S3FD.sh
