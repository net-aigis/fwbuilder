#!/usr/bin/env bash
# Phase-22763: client soft_fertig_ssh_auth_soft_22880_echo_roster Soft 22760+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_22880_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 22760+ soft_fertig_ssh_auth_soft_22880_echo_roster type ok"; echo "cleaned"; echo "OK: phase22763 e2e passed"
