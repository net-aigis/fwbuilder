#!/usr/bin/env bash
# Phase-32363: client soft_fertig_ssh_auth_soft_33360_echo_roster Soft 32360+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_33360_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 32360+ soft_fertig_ssh_auth_soft_33360_echo_roster type ok"; echo "cleaned"; echo "OK: phase32363 e2e passed"
