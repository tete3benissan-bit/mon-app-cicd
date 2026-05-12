#!/bin/bash
if ! command -v docker &> /dev/null; then
  yum update -y
  yum install -y docker
  systemctl start docker
  systemctl enable docker
fi