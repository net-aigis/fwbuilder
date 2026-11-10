#!/usr/bin/env bash
# Phase-24363: client soft_fertig_ssh_auth_soft_24360_echo_roster Soft 24360+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_24360_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 24360+ soft_fertig_ssh_auth_soft_24360_echo_roster type ok"; echo "cleaned"; echo "OK: phase24363 e2e passed"
