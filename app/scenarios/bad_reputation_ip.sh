#!/bin/bash
curl -s -o 04_badips.yaml https://upwind-templates.s3.us-east-2.amazonaws.com/04_badips.yaml && kubectl apply -f 04_badips.yaml 
