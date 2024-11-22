#!/usr/bin/env bash

# Flush existing rules
iptables -F -X

# Load defined rules
iptables-restore < rules.v4
