#!/bin/bash

az account set --subscription "OT-XC-Data-Platform-Foundation-${1:-prod}"
az account show
