#!/bin/bash

# This script allows to download Java from idiotic site of Oracle with automatic acceptance of their idiotic license

wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" $1
