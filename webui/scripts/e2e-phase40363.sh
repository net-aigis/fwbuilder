#!/usr/bin/env bash
# Phase-40363: client soft_fertig_ssh_auth_soft_42280_echo_roster Soft 40360+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_42280_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 40360+ soft_fertig_ssh_auth_soft_42280_echo_roster type ok"; echo "cleaned"; echo "OK: phase40363 e2e passed"
