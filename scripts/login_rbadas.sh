#!/bin/bash

az account set --subscription "sub-dataplatform-foundation-001-${1:-prod}"
az account show
