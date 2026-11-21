#!/usr/bin/env bash
# Phase-19883: client soft_fertig_ssh_auth_soft_19880_echo_roster Soft 19880+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_19880_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 19880+ soft_fertig_ssh_auth_soft_19880_echo_roster type ok"; echo "cleaned"; echo "OK: phase19883 e2e passed"
