#!/usr/bin/env bash
#
# Resource:
# https://www.imore.com/how-open-apps-anywhere-macos-catalina-and-mojave

function spctl_disable_assessments() {
  spctl --master-disable
}

[[ "${BASH_SOURCE[0]}" != "${0}" ]] || spctl_disable_assessments
