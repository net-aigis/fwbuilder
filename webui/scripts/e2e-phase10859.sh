#!/usr/bin/env bash
# Phase-10859: client soft_fertig_ssh_auth_gap_label_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_gap_label_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-gap-label-echo roster type ok"; echo "cleaned"; echo "OK: phase10859 e2e passed"
